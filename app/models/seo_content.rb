class SeoContent < Base
  include Mongoid::Document

  embedded_in :page

  field :title
  field :description
  field :keywords, default: ''

  validates :title, presence: true, length: { in: 1..70 } #{ in: 20..70 }
  validates :description, presence: true, length: {in: 1..160} #{ in: 50..160 }
end
