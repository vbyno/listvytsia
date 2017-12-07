require_relative 'concerns/authored'
require_relative 'concerns/pictured'

module AppComponent
  class Article < Page
    include Concerns::Authored
    include Concerns::Pictured

    belongs_to :picture, class_name: 'AppComponent::Ckeditor::Picture', optional: true

    field :content_intro

    validates :content_intro, :content, presence: true
  end
end
