module AppComponent
  SHOW_SEMINAR_PAGE = false

  class Engine < ::Rails::Engine
    isolate_namespace AppComponent

    cattr_accessor :mount_path

    initializer :append_migrations do |app|
      unless app.root.to_s.match(root.to_s + File::SEPARATOR)
        Mongoid::Migrator.migrations_path += ['components/app_component/db/migrate']
      end
    end

    # config.after_initialize do
    #   Rails.application.assets.context_class.tap do |klass|
    #     # klass.include ApplicationHelper
    #     # klass.include Rails.application.routes.url_helpers
    #     klass.include ActionView::Helpers
    #     klass.include SimpleForm::ActionViewExtensions::FormHelper
    #     klass.include AppComponent::Engine.helpers
    #     klass.include AppComponent::Engine.routes.url_helpers
    #     klass.include Core::Engine.helpers
    #     klass.include Core::Engine.routes.url_helpers
    #     klass.include ActionView::Helpers::TagHelper
    #   end
    # end
  end
end
