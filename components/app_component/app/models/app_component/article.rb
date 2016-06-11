require_relative 'concerns/authored'
require_relative 'concerns/pictured'

module AppComponent
  class Article < Page
    include Concerns::Authored
    include Concerns::Pictured

    field :content_intro

    validates :content_intro, :content, presence: true
  end
end
