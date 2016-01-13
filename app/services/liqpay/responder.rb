module Liqpay
  class Responder
    extend ActiveModel::Naming
    include ActiveModel::Validations

    attr_reader :params

    def initialize(params)
      @params = params
    end

    def donation
      @donation ||= Donation.by_id(response.order_id).first
    end

    def response
      @response ||= Liqpay::Response.new(params)
    end

    def valid?
      errors.add(:base, :invalid_order_id) and return false if donation.nil?
      errors.add(:base, :donation_is_already_paid) if donation.paid?
      errors.add(:base, :incorrect_amount) if donation.amount != response.amount

      errors.empty?
    end

    def errors
      @errors ||= ActiveModel::Errors.new(self)
    end
  end
end
