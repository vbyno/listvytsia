class Article
  include Mongoid::Document
  field :permalink
  field :title
  field :content
  field :active, type: Mongoid::Boolean

  validates :title, :permalink, :content, :active, presence: true
  validates :permalink, permalink: true

  def to_param
    permalink
  end
end
