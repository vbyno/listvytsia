require 'mongoid'
require 'mongoid_rails_migrations'
require 'rails'
require 'rabl'

require 'core'

module Events
  require 'events/engine'

  extend self
end
