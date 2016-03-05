class SeoContent < Base
  include Mongoid::Document

  embedded_in :page

  field :title
  field :description
  field :keywords, default: ''

  validates :title, presence: true, length: { in: 20..70 }
  validates :description, presence: true, length: { in: 50..160 }
end
