class Article
  include Mongoid::Document
  field :permalink
  field :title
  field :content
  field :active, type: Mongoid::Boolean
  belongs_to :author, class_name: 'User'

  validates :title, :permalink, :content, :active, :author, presence: true
  validates :permalink, permalink: true, uniqueness: true

  def to_param
    permalink
  end

  def author?(user)
    user.present? && author == user
  end
end
