Recaptcha.configure do |config|
  config.site_key, config.secret_key =
    Rails.application.config_for(:recaptcha).values_at('site_key', 'secret_key')
end

