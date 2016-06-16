module Hotels
  class Engine < ::Rails::Engine
    isolate_namespace Hotels

    mattr_accessor :mount_path
    @@mount_path = '/'
  end
end
