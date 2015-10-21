module Ckeditor
  class PicturePresenter < BasePresenter
    presents :picture

    def self.latest(view_context)
      Ckeditor::Picture.desc.limit(5).map { |picture| new(picture, view_context) }
    end

    def thumb_image
      h.image_tag(picture.data.thumb.url)
    end
  end
end
