require 'mongoid'
require 'mongoid_rails_migrations'
require 'rails'
require 'rabl'

require 'core'

module MicroGroups
  require 'micro_groups/engine'
  require 'micro_groups/region_path_manager'

  extend self

  def region_names
    Region.published.ordered.pluck(:name)
  end

  def published_region_permalinks
    Region.published.ordered.pluck(:permalink)
  end

  def all_region_permalinks
    Region.ordered.pluck(:permalink)
  end

  def links_info
    Region.published.ordered.map do |region|
      Struct.new(:name, :permalink).new(region.name, region.permalink).freeze
    end
  end

  def region_path(permalink)
    "/#{ permalink }"
  end
end
