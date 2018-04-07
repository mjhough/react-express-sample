class GoogleService
  def initialize(lat: nil, lng: nil, token: ENV['GOOGLE_TOKEN'])
    @lat = lat
    @lng = lng
    @token = token
  end

  def get_diff(points)
    points.max - points.min 
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
    all_split_points = points.map { |point| "#{point[:lat2]},#{point[:lon2]}" }.each_slice(190).to_a
  
    hydra = Typhoeus::Hydra.new
    successes = 0
    elevations = []
    all_split_points.each do |split_points|
      request = Typhoeus::Request.new("https://maps.googleapis.com/maps/api/elevation/json?locations=#{split_points.join('|')}&key=#{token}", timeout: 15000)
      request.on_complete do |response|
        if response.success?
          elevations.push(JSON.parse(response.body)['results'].map { |result| result['elevation'] })
          successes += 1
        end
      end
      hydra.queue(request)
    end
    hydra.run
    raise 'One or more requests failed' if successes != all_split_points.length
    elevations.flatten
  end

  protected

  def get_points
    GeographicService.find_all_points(lat, lng, 400, 5)
  end

  attr_reader :token
  attr_accessor :lat, :lng
end
