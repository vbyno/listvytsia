require 'rails'
require 'mongoid'
require 'mongoid_rails_migrations'
require 'pundit'
require 'devise'
require 'figaro'
require 'deface'
require 'rabl'
require 'slim-rails'

module Core
  require_relative 'core/engine'
  require_relative 'core/user_decorators'
  require_relative 'core/application_policy'
  require_relative 'core/base_presenter'
end
