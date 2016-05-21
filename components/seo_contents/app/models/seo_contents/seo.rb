module SeoContents
  module Seo
    extend ActiveSupport::Concern

    included do
      embeds_one :seo_content, class_name: 'SeoContents::SeoContent'
      accepts_nested_attributes_for :seo_content, reject_if: :all_blank

      validates :seo_content, presence: true,
                if: ->{ SeoContents.presence_validation_condition.to_proc.call(self) }
    end
  end
end
