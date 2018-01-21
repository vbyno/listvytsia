module Calendars
  class Item
    include Mongoid::Document
    include Mongoid::Timestamps
    include Core::ModelMethods

    field :city
    field :start_date, type: DateTime
    field :end_date, type: DateTime
    field :contacts
    field :course
    field :event_id

    validates :city, :start_date, :end_date, :contacts, presence: true
  end
end
