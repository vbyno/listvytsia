module SeoContents
  module SeoContentsHelper
    def seo_contents_form(target, form:)
      return unless target

      render('seo_contents/seo_contents/form', form: form, target: target)
    end

    def seo_contents_seo_content(target)
      return unless target

      render('seo_contents/seo_contents/seo_content', seo_content: target.seo_content)
    end
  end
end
