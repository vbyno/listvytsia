require File.expand_path('../boot', __FILE__)

require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'
require 'rails/mongoid'

Bundler.require(*Rails.groups)

module Listvytsia
  class Application < Rails::Application
    config.time_zone = 'Kyiv'
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.available_locales = :uk
    config.i18n.default_locale = :uk
    config.i18n.locale = :uk
    config.show_i18n_errors = true
    config.i18n.enforce_available_locales = true

    # gzip compression is not needed because it was implemented on Nginx layer
    # config.middleware.insert_before(Rack::Sendfile, Rack::Deflater)
  end
end
