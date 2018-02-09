class AirQualityService
  attr_reader :lat, :lng

  def initialize(lat:, lng:, token: ENV['AQICN_TOKEN'])
    @lat = lat
    @lng = lng
    @token = token
  end

  def get_aqi
    response = Faraday.get("http://api.waqi.info/feed/geo:#{lat};#{lng}/?token=#{token}")
    JSON.parse(response.body)['data']['aqi']
  end

  protected

  attr_reader :token
end
