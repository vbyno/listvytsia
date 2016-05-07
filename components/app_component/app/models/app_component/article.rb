require_relative 'concerns/authored'
require_relative 'concerns/pictured'
require_relative 'concerns/model_methods'

module AppComponent
  class Article < Page
    include Concerns::Authored
    include Concerns::Pictured
    include Concerns::ModelMethods

    field :content_intro

    validates :content_intro, :content, presence: true
  end
end
