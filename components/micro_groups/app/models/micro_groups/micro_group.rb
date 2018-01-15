module MicroGroups
  class MicroGroup
    ATTRIBUTES = %i( name permalink city idea leaders contacts methodologies published calendar_url )

    include Mongoid::Document
    include Mongoid::Timestamps
    include Core::ModelMethods

    field :name
    field :permalink
    field :city
    field :idea
    field :leaders
    field :contacts
    field :methodologies
    field :calendar_url
    field :published, type: Mongoid::Boolean, default: false

    validates :name, :city, :idea, :leaders, :contacts, :permalink, presence: true

    scope :published, ->{ where(published: true) }
    scope :ordered_created_at, ->{ order(created_at: :desc) }
    scope :of_city, ->(city) { where(city: city) }
  end
end
