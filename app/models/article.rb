class Article < Page
  field :content_intro
  belongs_to :author, class_name: 'User', inverse_of: :articles
  belongs_to :section, inverse_of: :articles
  belongs_to :picture, class_name: 'Ckeditor::Picture'

  scope :for_user, ->(user) { any_of({ published: true }, { author_id: user }) }

  validates :content_intro, :author, presence: true

  delegate :name, to: :author, prefix: true # author_name

  def author?(user)
    user.present? && author == user
  end

  def picture_url
    return '' unless picture

    picture.data.medium.url
  end
end
