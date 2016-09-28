module Chunks
  class Engine < ::Rails::Engine
    isolate_namespace Chunks

    mattr_accessor :mount_path
    @@mount_path = '/'

    initializer :append_migrations do |app|
      unless app.root.to_s.match(root.to_s + File::SEPARATOR)
        Mongoid::Migrator.migrations_path += ['components/chunks/db/migrate']
      end
    end
  end
end
