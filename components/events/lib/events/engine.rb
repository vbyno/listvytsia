module Events
  class Engine < ::Rails::Engine
    isolate_namespace Events

    mattr_accessor :mount_path
    @@mount_path = '/'
  end
end
