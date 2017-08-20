require File.expand_path('../boot', __FILE__)

require 'rails/mongoid'

require 'chunks'

module Dummy
  class Application < Rails::Application
    config.cache_classes = true
    config.eager_load = false
    config.public_file_server.enabled = true
    config.active_support.test_order = :random
    config.active_support.deprecation = :stderr
    Mongoid.load!(File.expand_path('../../../../component_mongoid.yml', __dir__), :test)
  end
end

