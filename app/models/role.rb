class Role < Base
  include Mongoid::Document

  field :title
  has_and_belongs_to_many :users, autosave: true
  embeds_many :permissions
  accepts_nested_attributes_for :permissions, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true, uniqueness: true
end
