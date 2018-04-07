class SearchController < SecureController

  def show
    render json: 'Hello'
  end

  def new
    byebug
    google_service = GoogleService.new
    lat_lng = google_service.get_lat_lng(params[:search])
    @hill_score = google_service.get_diff(google_service.get_all_elevations)
    @aqi = AirQualityService.new(lat_lng).get_aqi
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
