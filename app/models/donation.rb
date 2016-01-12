class Donation < Base
  include Mongoid::Document
  include Mongoid::Timestamps

  field :amount, type: Money

  validates :amount, numericality: { greater_than: 0 }
end
