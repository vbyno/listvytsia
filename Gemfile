source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'

gem 'bootstrap-sass'
gem 'pg'
gem 'simple_form'
gem 'mail_form'
gem 'slim-rails'
gem 'font-awesome-rails'
gem 'figaro'
gem 'recaptcha', require: 'recaptcha/rails'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', platforms: [:mri_21]

  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm'

  gem 'mailcatcher'
  gem 'pry'

  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'thin'
  gem 'rspec-rails'
  gem 'byebug'
  gem 'web-console'
  gem 'spring'
end

group :production do
  gem 'unicorn'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
