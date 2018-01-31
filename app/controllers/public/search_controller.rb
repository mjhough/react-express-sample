module Public
  class SearchController < BaseController
    def new
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
