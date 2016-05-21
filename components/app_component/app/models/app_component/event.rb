require_relative 'concerns/authored'
require_relative 'concerns/pictured'

module AppComponent
  class Event < Page
    include Concerns::Authored
    include Concerns::Pictured

    field :content_intro

    scope :related_to, ->(event) { where(:id.ne => event.id) }

    validates :content_intro, :content, presence: true
  end
end
