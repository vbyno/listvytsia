class Article < Page
  include Authored
  include Pictured

  field :content_intro

  validates :content_intro, :content, presence: true
end
