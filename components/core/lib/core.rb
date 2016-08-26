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
  require 'core/engine'
  require 'core/user_decorators'
end
