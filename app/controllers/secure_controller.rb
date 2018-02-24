class SecureController < ApplicationController
  before_action :check_authenticated

  protected

  def check_authenticated
    user_signed_in? || redirect_to(beta_signup_path)
  end

end
