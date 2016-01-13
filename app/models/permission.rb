class Permission < Base
  ACTIONS = %w( read create update moderate ).freeze
  RESOURCES = %w( articles roles ).freeze

  embedded_in :role
  field :resource
  field :action

  validates :resource, presence: true, inclusion: { in: RESOURCES }
  validates :action, presence: true, uniqueness: { scope: :resource }, inclusion: { in: ACTIONS }
end
