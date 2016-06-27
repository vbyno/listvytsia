module Core
  class Role
    include Mongoid::Document
    include Core::ModelMethods

    field :title
    has_and_belongs_to_many :users, class_name: 'Core::User', autosave: true
    embeds_many :permissions, class_name: 'Core::Permission'
    accepts_nested_attributes_for :permissions, allow_destroy: true, reject_if: :all_blank

    validates :title, presence: true, uniqueness: true
  end
end
