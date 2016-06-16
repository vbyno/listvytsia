ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment', __FILE__)

require 'rubygems'
require 'rspec/rails'
require 'rails/mongoid'
require 'mongoid/rspec'
require 'pry'

Dir[Hotels::Engine.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.tty = true
  config.order = 'random'

  config.include FactoryGirl::Syntax::Methods
  config.include Hotels::Engine.routes.url_helpers
  config.include Mongoid::Matchers, type: :model
end
