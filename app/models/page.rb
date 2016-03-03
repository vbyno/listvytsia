class Page < Base
  include Mongoid::Document
  include Mongoid::Timestamps

  field :permalink
  field :title
  field :content
  field :published, type: Mongoid::Boolean, default: false

  scope :published, -> { where(published: true) }

  validates :title, :permalink, :content, :published, presence: true
  validates :permalink, permalink: true, uniqueness: true

  def to_param
    permalink
  end
end

