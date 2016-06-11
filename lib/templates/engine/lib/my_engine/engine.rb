module <%= name %>
  class Engine < ::Rails::Engine
    isolate_namespace <%= name %>

    initializer :append_migrations do |app|
      unless app.root.to_s.match(root.to_s + File::SEPARATOR)
        Mongoid::Migrator.migrations_path += ['components/<%= file_name %>/db/migrate']
      end
    end
  end
end
