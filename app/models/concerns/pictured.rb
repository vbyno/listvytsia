module Pictured
  extend ActiveSupport::Concern

  included do
    belongs_to :picture, class_name: 'Ckeditor::Picture'

    def picture_url
      return '' unless picture

      picture.data.medium.url
    end

    def picture_content_url
      return '' unless picture

      picture.data.content.url
    end
  end
end
