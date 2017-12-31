module Calendars
  class Item
    include Mongoid::Document
    include Mongoid::Timestamps
    include Core::ModelMethods

    field :city
    field :start_date
    field :end_date
    field :contacts
    field :course

    validates :city, :start_date, :end_date, :contacts, presence: true
  end
end
