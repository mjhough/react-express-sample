SitemapGenerator::Sitemap.default_host = 'https://tolenno.com'
SitemapGenerator::Sitemap.public_path = 'tmp/sitemap'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new( 
aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],
aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
fog_provider: 'AWS',
fog_directory: ENV['tolenno'],
fog_region: ENV['us-east-1']
)

SitemapGenerator::Sitemap.sitemaps_host = "https://#{'ENV["S3_BUCKET_NAME"]'}.s3.amazonaws.com"
SitemapGenerator::Sitemap.create do
    add root_path
    add new_user_session_path
    add new_user_registration_path
end
