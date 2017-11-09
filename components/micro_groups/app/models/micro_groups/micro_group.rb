module MicroGroups
  class MicroGroup
    include Mongoid::Document
    include Mongoid::Timestamps
    include Core::ModelMethods

    field :name
    field :city
    field :idea
    field :leaders
    field :contacts
    field :methodologies
    field :calendar_url
    field :published, type: Mongoid::Boolean, default: false

    validates :name, :city, :idea, :leaders, :contacts, presence: true

    scope :published, ->{ where(published: true) }
  end
end
