# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://tolenno.com"
SitemapGenerator::Sitemap.public_path = "tmp/sitemap"

SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new( 
aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
aws_secret_access_key: ENV['AWS_SECRET_KEY'],
fog_provider: 'AWS',
fog_directory: ENV['S3_BUCKET_NAME'],
fog_region: ENV['S3_REGION']
)

SitemapGenerator::Sitemap.create do
  add new_user_session_path
  add new_user_registration_path
end
