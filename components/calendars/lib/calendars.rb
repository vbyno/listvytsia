require 'mongoid'
require 'mongoid_rails_migrations'
require 'rails'
require 'rabl'

require 'core'

module Calendars
  require 'calendars/engine'
  require 'calendars/date_formatter'

  extend self
end
