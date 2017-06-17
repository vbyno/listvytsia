require 'mongoid'
require 'carrierwave/mongoid'

module Pictures
  class Engine < ::Rails::Engine
    isolate_namespace Pictures

    cattr_accessor :mount_path

    initializer :append_migrations do |app|
      unless app.root.to_s.match(root.to_s + File::SEPARATOR)
        app.config.paths['db/migrate'].concat config.paths['db/migrate'].expanded
      end
    end
  end
end
