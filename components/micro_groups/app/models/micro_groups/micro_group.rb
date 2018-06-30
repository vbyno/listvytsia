module MicroGroups
  class MicroGroup
    ATTRIBUTES = %i(
      name
      permalink
      city
      idea
      leaders
      contacts
      methodologies
      published
      calendar_url
      priority
    ).freeze

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
    field :priority, type: Integer, default: 0
    field :published, type: Mongoid::Boolean, default: false

    belongs_to :region, class_name: 'MicroGroups::Region',
                        foreign_key: :city,
                        primary_key: :name

    validates :name, :city, :idea, :leaders, :contacts, :permalink, presence: true

    scope :published, ->{ where(published: true) }
    scope :ordered_by_priority, ->{ order(priority: :desc) }
    scope :of_city, ->(city) { where(city: city) }
  end
end
