module Core
  class Permission
    include Mongoid::Document
    include Core::ModelMethods

    ACTIONS = %w( read create update moderate ).freeze
    RESOURCES = %w( articles roles events ).freeze

    embedded_in :role, class_name: 'Core::Role'
    field :resource
    field :action

    validates :resource, presence: true, inclusion: { in: RESOURCES }
    validates :action, presence: true, uniqueness: { scope: :resource }, inclusion: { in: ACTIONS }
  end
end
