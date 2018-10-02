require File.expand_path('../boot', __FILE__)

require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
require 'rails/mongoid'

# Bundler.require(*Rails.groups)
require 'core'

module Dummy
  class Application < Rails::Application
    config.cache_classes = true
    config.eager_load = false
    config.public_file_server.enabled = true
    config.active_support.test_order = :random
    config.active_support.deprecation = :stderr
    config.action_mailer.delivery_method = :test
    Mongoid.load!(File.expand_path('../../../../component_mongoid.yml', __dir__), :test)
  end
end
