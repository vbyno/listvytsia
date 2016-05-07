require_relative 'public_controller'

module AppComponent
  class ContactFormsController < PublicController
    def create
      return unless verify_recaptcha(model: contact_form,
                                     message: t('.invalid_captcha'),
                                     timeout: 10)

      contact_form.deliver
    end

    private

    def contact_form_params
      params.require(:contact_form).permit(:name, :email, :message, :nickname)
    end

    def contact_form
      @contact_form ||= ContactForm.new(contact_form_params)
    end
  end
end
