class GoogleService
  def initialize(lat: nil, lng: nil, token: ENV['GOOGLE_TOKEN'])
    @lat = lat
    @lng = lng
    @token = token
  end

  def get_lat_lng(address)
    response = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=#{token}")
    location = JSON.parse(response.body)['results'][0]['geometry']['location']
    lat_lng = {lat: location['lat'].to_s, lng: location['lng'].to_s}
    self.lat = lat_lng[:lat]
    self.lng = lat_lng[:lng]
    lat_lng
  end

  protected

  attr_reader :token
  attr_accessor :lat, :lng
end