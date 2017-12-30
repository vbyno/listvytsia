module Calendars
  class Engine < ::Rails::Engine
    isolate_namespace Calendars

    mattr_accessor :mount_path
    @@mount_path = '/'
  end
end
