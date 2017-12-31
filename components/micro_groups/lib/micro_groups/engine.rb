module MicroGroups
  class Engine < ::Rails::Engine
    isolate_namespace MicroGroups

    mattr_accessor :mount_path
    @@mount_path = '/'
  end
end
