class ContactFormsController < ApplicationController
  def create
    @contact_form = ContactForm.new(contact_form_params)
    @contact_form.try(:deliver)
  end

private
  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :message, :nickname)
  end
end
