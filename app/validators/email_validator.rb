class EmailValidator < EachValidatorBase
  def regexp
    /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  end

  def error_message
    I18n.t('error_messages.invalid_email_format')
  end
end
