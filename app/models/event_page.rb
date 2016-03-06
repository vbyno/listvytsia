class EventPage < Page
  include Authored
  include Pictured

  validates :content, presence: true
end
