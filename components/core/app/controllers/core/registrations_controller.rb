class Core::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]

  private

  # def account_update_params
  def sign_up_params
    params
      .require(:user)
      .permit(
        :email,
        :password,
        :password_confirmation,
        profile: [:first_name, :last_name]
      )
  end

  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_up_params
      resource.validate
      set_minimum_password_length

      respond_with resource, location: core.new_user_registration_path
    end
  end
end
