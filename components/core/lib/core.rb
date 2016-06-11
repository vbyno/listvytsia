require 'rails'
require 'mongoid'
require 'mongoid_rails_migrations'
require 'pundit'

module Core
  require 'core/engine'

  autoload :MissedUser, 'core/missed_user'
end
