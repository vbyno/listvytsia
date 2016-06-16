require 'spec_helper'
require 'capybara/rails'

Capybara.default_max_wait_time = 5

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.default_max_wait_time = 5

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Warden::Test::Helpers

  config.before :suite do
    Warden.test_mode!
  end

  config.after :each do
    Warden.test_reset!
  end
end
