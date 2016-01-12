ENV["RAILS_ENV"] = 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'rubygems'
require 'rspec/rails'
require 'factory_girl_rails'
require 'rails/mongoid'
require 'money-rails/test_helpers'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  # config.color_enabled = true
  # Use color not only in STDOUT but also in pagers and files
  config.tty = true
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'

  # http://stackoverflow.com/questions/6296235/undefined-method-get-for-rspeccoreexamplegroupnested-10x00000106db51f
  config.infer_spec_type_from_file_location!

  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  config.include Warden::Test::Helpers
  config.include Rails.application.routes.url_helpers
  config.include Mongoid::Matchers, type: :model

  config.before do
    I18n.locale = :uk
  end

  # Clean/Reset Mongoid DB prior to running each test.
  config.before(:each) do
    # Temporary fix while database cleaning does not work
    [Role, Permission, Article, User, Admin].each(&:delete_all)
    # Mongoid::Sessions.default_session.collections.select {|c| c.name !~ /system/ }.each(&:drop)
  end
end