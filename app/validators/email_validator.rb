class EmailValidator < EachValidatorBase
  REGEXP = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  def regexp
    REGEXP
  end

  def error_message
    I18n.t('error_messages.invalid_email_format')
  end
end
