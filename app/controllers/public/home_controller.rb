module Public
  class HomeController < BaseController
    def index; end

    def email_confirm
      @header_text =  'Great! Now what?'
      @body_text =  'Please confirm your email address to get started.'
      @button_text =  'Go Back To Tolenno'
      @excited =  true

      render 'message'
    end

    def beta_success
      @header_text =  'You did it!'
      @body_text =  'You can now login to the Tolenno Beta Program'
      @button_text =  'Login to Tolenno Beta'
      @excited =  false

      render 'message'
    end

    def newsletter_success
      @header_text =  'Awesome news!'
      @body_text = "You're now signed up to Tolenno news!"
      @button_text =  'Go Back To Tolenno'
      @excited =  false

      render 'message'
    end
  end
end
