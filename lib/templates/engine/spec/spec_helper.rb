ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment', __FILE__)

require 'rubygems'
require 'rspec/rails'
require 'factory_girl'
require 'rails/mongoid'
require 'pry'
require 'mongoid/rspec'

Dir[Hotels::Engine.root.join('spec/support/**/*.rb')].each { |f| require f }

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
  config.include Warden::Test::Helpers
  config.include <%= name %>::Engine.routes.url_helpers
  config.include Devise::TestHelpers, type: :controller
  config.include Mongoid::Matchers, type: :model

  config.before do
    I18n.locale = :uk
  end

  # Clean/Reset Mongoid DB prior to running each test.
  config.before(:each) do
    [
      # <%= name %>::<%= name.singularize %>,
    ].each(&:delete_all)
    # Mongoid::Sessions.default_session.collections.select {|c| c.name !~ /system/ }.each(&:drop)
  end
end
