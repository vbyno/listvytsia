module MicroGroups
  class Region
    ATTRIBUTES = %i( name info permalink calendar_url priority published )

    include Mongoid::Document
    include Mongoid::Timestamps
    include Core::ModelMethods
    include Core::Concerns::Permalinkable

    field :name
    field :info
    field :calendar_url
    field :priority, type: Integer, default: 1
    field :published, type: Mongoid::Boolean, default: false

    validates :name, presence: true, uniqueness: true

    scope :published, ->{ where(published: true) }
    scope :ordered,   ->{ order(priority: :desc) }
  end
end
