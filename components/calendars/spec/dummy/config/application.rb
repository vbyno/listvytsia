require File.expand_path('../boot', __FILE__)

require 'action_controller/railtie'
require 'action_view/railtie'
require 'rails/mongoid'

#Bundler.require(*Rails.groups)
require 'calendars'

module Dummy
  class Application < Rails::Application
    config.time_zone = 'Kyiv'
    config.cache_classes = true
    config.eager_load = false
    config.public_file_server.enabled = true
    config.active_support.test_order = :random
    config.active_support.deprecation = :stderr
    Mongoid.load!(File.expand_path('../../../../component_mongoid.yml', __dir__), :test)
  end
end

