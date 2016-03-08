class Event < Page
  include Authored
  include Pictured

  field :content_intro

  scope :related_to, ->(event) { where(:id.ne => event.id) }

  validates :content_intro, :content, presence: true
end
