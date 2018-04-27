module Public
  class BaseController < ApplicationController
    layout 'public'
    # before_action :set_uuid
    # before_action :check_logged_in

    private

    # def check_logged_in
    #   redirect_to root_path if user_signed_in?
    # end

    def set_uuid
      session[:id] ||= SecureRandom.uuid
    end
  end
end
