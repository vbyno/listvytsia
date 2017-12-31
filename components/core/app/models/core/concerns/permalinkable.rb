module Core
  module Concerns
    module Permalinkable
      extend ActiveSupport::Concern

      included do
        field :permalink

        scope :by_permalink, ->(permalink) { where(permalink: permalink) }

        validates :permalink, :'core/permalink' => true, uniqueness: true, presence: true
      end

      def to_param
        permalink
      end
    end
  end
end
