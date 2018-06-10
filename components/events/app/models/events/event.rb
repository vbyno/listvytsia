module Events
  class Event
    include Mongoid::Document
    include Mongoid::Timestamps
    include Core::ModelMethods

    field :title
    field :subtitle
    field :city
    field :start_time, type: DateTime
    field :end_time, type: DateTime
    field :contacts
    field :info
    field :info_translation
    field :permalink

    embeds_one :location, class_name: 'Events::Location'
    embeds_many :info_blocks, class_name: 'Events::InfoBlock'

    belongs_to :region, class_name: 'MicroGroups::Region',
                        foreign_key: :city,
                        primary_key: :name

    ATTRIBUTES = %i(
      id
      title
      subtitle
      city
      start_time
      end_time
      contacts
      info
      info_translation
      permalink
    )

    validates :city, :start_time, :end_time, :contacts, presence: true

    scope :by_title, ->(title) { where(title: title) }
    scope :by_city, ->(city) { where(city: city) }
  end
end
