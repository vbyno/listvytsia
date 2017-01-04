source 'https://rubygems.org'
ruby '2.3.0'

path 'components' do
  gem 'app_component'
  gem 'pictures'
  gem 'hotels'
  gem 'seo_contents'
  gem 'core'
  gem 'generators'
end

gem 'rails'
gem 'rails-i18n'
gem 'mongoid', '~> 5.1.0'
gem 'mongoid_rails_migrations', github: 'vbyno/mongoid_rails_migrations'
gem 'bson_ext'

gem 'devise'
gem 'devise-i18n'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'pundit'
gem 'figaro'
gem 'simple_form'
gem 'mail_form'
gem 'liqpay'
gem 'money-rails'

gem 'angularjs-rails'
gem 'angular-rails-templates'
gem 'sprockets'
gem 'jquery-rails'
gem 'underscore-rails'
gem 'coffee-rails'
gem 'turbolinks'
gem 'rabl'

gem 'slim-rails'
gem 'sass-rails'
gem 'bootstrap-sass'
gem 'uglifier'

gem 'ckeditor', github: 'mkaszubowski/ckeditor' # https://github.com/galetahub/ckeditor/issues/551
gem 'carrierwave-mongoid', require: 'carrierwave/mongoid'
gem 'mini_magick'
gem 'font-awesome-rails'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'gmaps4rails'
gem 'awesome_print'
gem 'foreman'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', platforms: [:mri_21]

  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm'
  gem 'capistrano-faster-assets'

  gem 'mailcatcher'

  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
  gem 'web-console'
end

group :development, :test do
  gem 'puma'
  gem 'byebug'
  gem 'pry'
  gem 'rb-readline'
end

group :production do
  gem 'unicorn'
end

group :test do
  gem 'rspec-rails'
  gem 'mongoid-rspec'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'launchy'
  gem 'fuubar', require: false
end
