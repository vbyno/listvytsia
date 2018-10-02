module MicroGroups
  class RegionPathManager
    DEFAULT_REGION_PATH = 'lviv'

    def initialize(path)
      @path = path
      @db_regions = MicroGroups::Region.published
    end

    def region_to_display
      region_to_openstruct(current_region)
    end

    def main_region
      region_to_openstruct(default_region)
    end

    def regions_to_display
      (db_regions.sort_by(&:name) - [default_region]).map do |region|
        region_to_openstruct(region)
      end
    end

    def active?
      !current_region.nil? && !is_default?
    end

    def is_default?
      current_region == default_region
    end

    private

    attr_reader :db_regions, :path

    def region_to_openstruct(region)
      OpenStruct.new(name: region.name, permalink: "/#{ region.permalink }")
    end

    def current_region
      @current_region ||= db_regions.detect { |r| path.include?(r.permalink) }
    end

    def default_region
      db_regions.detect { |r| r.permalink == DEFAULT_REGION_PATH }
    end
  end
end
