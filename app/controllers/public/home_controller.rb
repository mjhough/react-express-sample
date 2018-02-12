module Public
  class HomeController < BaseController
    before_action :has_email_param, only: %i(email_confirm beta_success newsletter_success)

    def email_confirm
      @header_text =  'Great! Now what?'
      @body_text =  'Please confirm your email address to get started.'
      @button_text =  'Go Back To Tolenno'
      @button_link = '/'
      @excited =  true

      render 'message'
    end

    def beta_success
      @header_text =  'You did it!'
      @body_text =  'You can now login to the Tolenno Beta Program'
      @button_text =  'Login to Tolenno Beta'
      @button_link = 'https://tolenno.com/login'
      @excited =  false
      @event = 'Confirmed beta email'

      render 'message'
    end

    def newsletter_success
      @header_text =  'Awesome news!'
      @body_text = "You're now signed up to Tolenno news!"
      @button_text =  'Go Back To Tolenno'
      @excited =  false
      @button_link = '/'
      @event = 'Confirmed newsletter email'

      render 'message'
    end

    private

    def has_email_param
      redirect_to root_path unless params[:drip_email]
    end

  end
end
