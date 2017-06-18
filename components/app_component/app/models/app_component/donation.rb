module AppComponent
  class Donation
    include Mongoid::Document
    include Mongoid::Timestamps
    include Core::ModelMethods

    field :amount, type: Money
    field :paid, type: Mongoid::Boolean, default: false

    scope :by_id, ->(id) { where(id: id) }

    validates :amount, :'app_component/positive_money' => true
    validates :paid, inclusion: { in: [true, false] }

    def confirm!
      update_attributes(paid: true)
    end
  end
end
