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

  def get_all_elevations
    points = get_points
    all_split_points = points.map { |point| "#{point[:lat2]},#{point[:lon2]}" }.each_slice(52).to_a

    all_split_points.map do |split_points|
      response = Faraday.get("https://maps.googleapis.com/maps/api/elevation/json?locations=#{split_points.join('|')}&key=#{token}")
      JSON.parse(response.body)['results'].map { |result| result['elevation'] }
    end
  end

  protected

  def get_points
    GeographicService.find_all_points(lat, lng, 500, 6)
  end

  attr_reader :token
  attr_accessor :lat, :lng
end
