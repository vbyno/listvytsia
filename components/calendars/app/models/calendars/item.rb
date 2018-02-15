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

    scope :actual_at_time, ->(time) { where(:end_date.gte => time) }
    scope :ordered_by_start_date, ->{ order(start_date: :asc) }
  end
end
