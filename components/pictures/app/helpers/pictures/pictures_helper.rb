module Pictures
  module PicturesHelper
    def pictures_form(page_id)
      return unless page_id

      render('pictures/pictures/collection_form', page_id: page_id)
    end
  end
end
