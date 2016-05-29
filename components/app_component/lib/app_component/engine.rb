require 'mongoid'
require 'carrierwave/mongoid'
require 'money-rails'
require 'devise'
require 'pundit'
require 'figaro'
require 'liqpay'
require 'simple_form'
require 'rabl'
require 'slim-rails'
require 'mongoid_rails_migrations'
require 'ckeditor'
require 'gmaps4rails'

module AppComponent
  class Engine < ::Rails::Engine
    isolate_namespace AppComponent

    cattr_accessor :mount_path

    initializer :append_migrations do |app|
      unless app.root.to_s.match(root.to_s + File::SEPARATOR)
        Mongoid::Migrator.migrations_path += ['components/app_component/db/migrate']
      end
    end

    config.generators do |g|
      g.orm             :mongoid
      g.test_framework  :rspec
      g.assets          false
      g.helper          false
    end
  end
end
