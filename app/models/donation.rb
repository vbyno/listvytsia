class Donation < Base
  include Mongoid::Timestamps

  field :amount, type: Money
  field :paid, type: Mongoid::Boolean, default: false

  validates :amount, numericality: { greater_than: 0 }
  validates :paid, inclusion: { in: [true, false] }

  def confirm!
    update_attributes(paid: true)
  end
end
