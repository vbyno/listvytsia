ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment', __FILE__)

require 'rubygems'
require 'rspec/rails'
require 'rails/mongoid'
require 'pry'

Dir[
  MicroGroups::Engine.root.join('spec/support/**/*.rb'),
  Core::Engine.root.join('spec/support/**/*.rb')
].each { |f| require f }

RSpec.configure do |config|
  config.tty = true

  config.include FactoryGirl::Syntax::Methods
  config.include MicroGroups::Engine.routes.url_helpers
  config.include Warden::Test::Helpers
  config.include Devise::Test::ControllerHelpers, type: :controller
end
