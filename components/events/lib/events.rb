require 'mongoid'
require 'mongoid_rails_migrations'
require 'rails'
require 'rabl'

require 'core'
require 'micro_groups' # we need regions

module Events
  require 'events/engine'

  extend self
end
