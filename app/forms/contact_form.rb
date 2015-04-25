class ContactForm < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: EmailValidator::REGEXP
  attribute :message, validate: true
  attribute :nickname, captcha: true

  def headers
    {
      subject: I18n.t('contact_forms.contact_form.subject'),
      to: I18n.t('site_info.email'),
      from: %("#{name}" <#{email}>)
    }
  end
end
