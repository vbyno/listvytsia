require 'mongoid'
require 'mongoid_rails_migrations'
require 'rails'
require 'rabl'

require 'core'

module MicroGroups
  require 'micro_groups/engine'

  extend self

  def region_names
    Region.order(priority: :desc).pluck(:name)
  end
end
