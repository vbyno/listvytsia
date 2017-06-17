require File.expand_path('../boot', __FILE__)

require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'
require 'rails/mongoid'

Bundler.require(*Rails.groups)
require 'app_component'

module Dummy
  class Application < Rails::Application
    config.cache_classes = true
    config.eager_load = false
    config.public_file_server.enabled = true
    config.consider_all_requests_local = true
    config.action_controller.perform_caching = false
    config.action_dispatch.show_exceptions = false
    config.action_controller.allow_forgery_protection = false
    config.action_mailer.delivery_method = :test
    config.active_support.test_order = :random
    config.active_support.deprecation = :stderr
    config.action_mailer.default_url_options = { host: 'localhost' }
  end
end

