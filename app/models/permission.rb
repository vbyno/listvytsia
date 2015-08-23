class Permission
  include Mongoid::Document

  ACTIONS = %w( read create update ).freeze
  RESOURCES = %w( articles roles ).freeze

  embedded_in :role
  field :resource_identifier
  field :action_identifier

  validates :resource_identifier, presence: true, inclusion: { in: RESOURCES }
  validates :action_identifier, presence: true,
            uniqueness: { scope: :resource_identifier }, inclusion: { in: ACTIONS }
end
