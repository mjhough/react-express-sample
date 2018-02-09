module Public
  class SearchController < BaseController
    def new
      @aqi = AirQualityService.new(lat: '-27.496999', long: '153.089334').get_aqi
      @user_email = params[:'Email Address']
      render 'sign_up_notify'

      # 1. Geocode the input
      # 2. Call each API and add score together
      # 3. render the results
    end

    protected

    def final_result(greenspace_score, pollution_score, healthcare_score)
      
    end
  end
end
