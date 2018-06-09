module Events
  class InfoBlock
    include Mongoid::Document
    include Mongoid::Timestamps
    include Core::ModelMethods

    ATTRIBUTES = %i( name content )

    field :name
    field :content

    embedded_in :event, class_name: 'Events::Event'

    validates *ATTRIBUTES, presence: true
  end
end
