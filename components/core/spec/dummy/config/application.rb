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
  end
end

