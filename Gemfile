source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails'
gem 'rails-i18n'
gem 'mongoid', '~> 5.0.0.beta'
gem 'mongoid_rails_migrations'
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
gem 'sprockets', '2.12.3' # http://www.ademartutor.com/angular-rails-templates-gem-error-with-sprockets-3-0-o/
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
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'thin'
  gem 'byebug'
  gem 'web-console'
  gem 'spring'
  gem 'pry-rails'
end

group :production do
  gem 'unicorn'
end

group :test do
  gem 'rspec-rails'
  gem 'mongoid-rspec', '2.3.0.beta'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'fuubar', require: false
end
