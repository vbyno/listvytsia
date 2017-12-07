module Profiles
  class Engine < ::Rails::Engine
    isolate_namespace Profiles

    mattr_accessor :mount_path
    @@mount_path = '/'
  end
end
