class Article
  include Mongoid::Document
  field :permalink
  field :title
  field :content
  field :published, type: Mongoid::Boolean
  belongs_to :author, class_name: 'User', inverse_of: :articles

  validates :title, :permalink, :content, :published, :author, presence: true
  validates :permalink, permalink: true, uniqueness: true

  def to_param
    permalink
  end

  def author?(user)
    user.present? && author == user
  end
end
