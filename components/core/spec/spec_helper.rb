ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment', __FILE__)

require 'rubygems'
require 'rspec/rails'
require 'rails/mongoid'
require 'pry'

Dir[Core::Engine.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  # config.color_enabled = true
  # Use color not only in STDOUT but also in pagers and files
  config.tty = true
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'

  config.include Warden::Test::Helpers
  config.include Core::Engine.routes.url_helpers
  config.include Devise::TestHelpers, type: :controller

  config.before do
    I18n.locale = :uk
  end
end
