require_relative 'concerns/permalinkable'

module AppComponent
  class Page
    include Mongoid::Document
    include Mongoid::Timestamps

    include Concerns::Permalinkable
    include Core::ModelMethods

    field :title
    field :content
    field :published, type: Mongoid::Boolean, default: false

    scope :published, -> { where(published: true) }
    scope :sorted_by_date, -> { order_by(created_at: :desc) }
    scope :latest, ->(count) { published.sorted_by_date.limit(count) }

    validates :title, presence: true
  end
end
