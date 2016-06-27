module Core
  class Engine < ::Rails::Engine
    isolate_namespace Core

    initializer :append_migrations do |app|
      unless app.root.to_s.match(root.to_s + File::SEPARATOR)
        Mongoid::Migrator.migrations_path += ['components/core/db/migrate']
      end
    end
  end
end
