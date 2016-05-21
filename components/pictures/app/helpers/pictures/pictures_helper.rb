module Pictures
  module PicturesHelper
    def pictures_engine
      Pictures::Engine.routes.url_helpers
    end

    def pictures_form(page_id)
      return unless page_id

      render('pictures/pictures/collection_form', page_id: page_id)
    end

    def pictures_gallery(target_id)
      return unless target_id

      render('pictures/pictures/gallery', target_id: target_id.to_s)
    end
  end
end
