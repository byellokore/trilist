class ConfirmationsController < Devise::ConfirmationsController
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  private
  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new
      # Look for any other validation errors besides Recaptcha
      respond_with_navigational(resource) { render :new, notice: :send_paranoid_instructions }
    end
  end
end
