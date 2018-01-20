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
    field :permalink

    ATTRIBUTES = %i( id title city start_time end_time contacts permalink )

    validates :city, :start_time, :end_time, :contacts, presence: true

    scope :by_title, ->(title) { where(title: title) }
    scope :by_city, ->(city) { where(city: city) }
  end
end
