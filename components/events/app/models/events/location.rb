module Events
  class Location
    include Mongoid::Document
    include Core::ModelMethods

    field :latitude
    field :longitude
    field :information

    embedded_in :event, class_name: 'Events::Event'

    validates :latitude, :longitude, :information, presence: true
  end
end
