require_relative 'concerns/model_methods'

module AppComponent
  class Donation
    include Mongoid::Document
    include Mongoid::Timestamps
    include Concerns::ModelMethods

    field :amount, type: Money
    field :paid, type: Mongoid::Boolean, default: false

    scope :by_id, ->(id) { where(id: id) }

    validates :amount, numericality: { greater_than: 0 }
    validates :paid, inclusion: { in: [true, false] }

    def confirm!
      update_attributes(paid: true)
    end
  end
end
