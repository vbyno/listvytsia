module SeoContents
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      SeoContents.presence_validation_condition = :published?
      AppComponent::Page.include SeoContents::Seo
    end
  end
end
