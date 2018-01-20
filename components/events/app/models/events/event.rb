module Events
  class Event
    include Mongoid::Document
    include Mongoid::Timestamps
    include Core::ModelMethods

    field :title
    field :city
    field :start_time, type: DateTime
    field :end_time, type: DateTime
    field :contacts

    ATTRIBUTES = %i( id title city start_time end_time contacts )

    validates :city, :start_time, :end_time, :contacts, presence: true
  end
end
