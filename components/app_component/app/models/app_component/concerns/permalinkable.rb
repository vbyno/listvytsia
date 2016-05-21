module AppComponent
  module Concerns
    module Permalinkable
      extend ActiveSupport::Concern

      included do
        field :permalink

        scope :by_permalink, ->(permalink) { where(permalink: permalink) }

        validates :permalink, permalink: true, uniqueness: true, presence: true
      end

      def to_param
        permalink
      end
    end
  end
end
