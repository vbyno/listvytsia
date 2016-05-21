require 'seo_contents/engine'

module SeoContents
  class << self
    def presence_validation_condition
      @presence_validation_condition ||= proc { false }
    end

    def presence_validation_condition=(value)
      @presence_validation_condition = value
    end
  end
end
