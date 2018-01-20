module Events
  class Event
    include Mongoid::Document
    include Mongoid::Timestamps
    include Core::ModelMethods

    field :title
    field :city
    field :start_time
    field :end_time
    field :contacts

    ATTRIBUTES = %i( id title city start_time end_time contacts )

    validates :city, :start_time, :end_time, :contacts, presence: true
  end
end
