class Page < Base
  include Mongoid::Document
  include Mongoid::Timestamps

  include Permalinkable

  field :title
  field :content
  field :published, type: Mongoid::Boolean, default: false

  scope :published, -> { where(published: true) }

  validates :title, :content, :published, presence: true
end

