class CustomAuthenticationFailure < Devise::FailureApp
  protected

  def redirect_url
    ENV['BETA_MODE'] == 'true' ? beta_path : new_user_session_path
  end
end
