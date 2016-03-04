class Section < Base
  include Mongoid::Document
  include Mongoid::Timestamps

  include Permalinkable

  field :title

  has_many :articles, inverse_of: :section, autosave: true

  validates :title, presence: true
end
