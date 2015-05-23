class ContactFormsController < ApplicationController
  def create
    @contact_form = ContactForm.new(contact_form_params)
    if verify_recaptcha(model: @contact_form, message: t('.invalid_captcha'))
      @contact_form.try(:deliver)
    end
  end

private
  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :message, :nickname)
  end
end