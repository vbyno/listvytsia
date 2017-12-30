module Calendars
  class Calendar
    include Mongoid::Document
    include Mongoid::Timestamps
    include Core::ModelMethods
  end
end
