require_relative 'concerns/authored'
require_relative 'concerns/model_methods'

module AppComponent
  class Permission
    include Mongoid::Document
    include Concerns::ModelMethods

    ACTIONS = %w( read create update moderate ).freeze
    RESOURCES = %w( articles roles events ).freeze

    embedded_in :role, class_name: 'AppComponent::Role'
    field :resource
    field :action

    validates :resource, presence: true, inclusion: { in: RESOURCES }
    validates :action, presence: true, uniqueness: { scope: :resource }, inclusion: { in: ACTIONS }
  end
end
