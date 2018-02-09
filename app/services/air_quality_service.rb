class AirQualityService
  attr_reader :lat, :long

  def initialize(lat:, long:)
    @lat = lat
    @long = long
  end

  def get_aqi
    response = Faraday.get("http://api.waqi.info/feed/geo:#{lat};#{long}/?token=#{ENV['AQICN_TOKEN']}")
    JSON.parse(response.body)['data']['aqi']
  end
end
