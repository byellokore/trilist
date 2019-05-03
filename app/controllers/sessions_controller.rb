class SessionsController < Devise::SessionsController
  prepend_before_action :check_captcha, only: [:create,:new] # Change this to be any actions you want to protect.

  private
  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_in_params
      resource.validate # Look for any other validation errors besides Recaptcha
      set_minimum_password_length
      #puts resource.class
      #puts resource.methods
      respond_with_navigational(resource) { render :new }
    end
  end
end
