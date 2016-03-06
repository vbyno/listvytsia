module Authored
  extend ActiveSupport::Concern

  included do
    belongs_to :author, class_name: 'User'

    scope :for_user, ->(user) { any_of({ published: true }, { author_id: user }).order_by(created_at: :desc) }

    validates :author, presence: true

    delegate :name, to: :author, prefix: true # author_name

    def author?(user)
      user.present? && author == user
    end
  end
end
