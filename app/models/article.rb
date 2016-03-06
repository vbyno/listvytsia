class Article < Page
  include Authored

  field :content_intro
  belongs_to :picture, class_name: 'Ckeditor::Picture'

  validates :content_intro, :content, presence: true

  def picture_url
    return '' unless picture

    picture.data.medium.url
  end
end
