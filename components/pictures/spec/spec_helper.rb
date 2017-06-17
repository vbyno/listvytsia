ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../dummy/config/environment", __FILE__)

require 'rubygems'
require 'rspec/rails'
require 'factory_girl_rails'
require 'rails/mongoid'
require 'mongoid-rspec'
require 'pry'

Dir[Pictures::Engine.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!
  config.warnings = false
  config.profile_examples = nil
  config.order = :random
  config.expose_dsl_globally = true
  Kernel.srand config.seed

  config.include FactoryGirl::Syntax::Methods
  config.include Rails.application.routes.url_helpers
  config.include Mongoid::Matchers, type: :model

  config.before do
    I18n.locale = :uk
  end

  config.before(:each) do
    # Temporary fix while database cleaning does not work
    Pictures::Picture.delete_all
  end

  config.after(:all) do
    if Rails.env.test?
      FileUtils.rm_rf(Dir["#{Rails.root}/public/uploads"])
    end
  end
end

