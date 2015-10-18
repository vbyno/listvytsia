class Article < Base
  include Mongoid::Document
  include Mongoid::Timestamps
  field :permalink
  field :title
  field :content
  field :content_intro
  field :published, type: Mongoid::Boolean
  belongs_to :author, class_name: 'User', inverse_of: :articles

  scope :published, -> { where(published: true) }
  scope :for_author, ->(author) { any_of({ published: true }, { author_id: author }) }

  validates :title, :permalink, :content, :content_intro, :published, :author, presence: true
  validates :permalink, permalink: true, uniqueness: true

  delegate :name, to: :author, prefix: true

  def to_param
    permalink
  end

  def author?(user)
    user.present? && author == user
  end
end
