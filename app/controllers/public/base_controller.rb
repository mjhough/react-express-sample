module Public
  class BaseController < ApplicationController
    layout 'public'
    before_action :set_uuid

    private

    def set_uuid
      session[:id] ||= SecureRandom.uuid
    end
  end
end
