class PermalinkValidator < EachValidatorBase
  def regexp
    /\A([a-z0-9-_]*)\z/i
  end

  def error_message
    I18n.t('error_messages.invalid_permalink_format')
  end
end
