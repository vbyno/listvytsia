module SeoContents
  module SeoContentsHelper
    def seo_contents_engine
      SeoContents::Engine.routes.url_helpers
    end

    def seo_contents_form(target_id)
      return unless target_id

      render('seo_contents/seo_contents/form', seo_content: SeoContents::SeoContent.for_target(target_id))
    end
  end
end
