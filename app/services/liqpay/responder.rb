module Liqpay
  class Responder
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def confirm
      donation.confirm! if valid?
    rescue Liqpay::InvalidResponse => e
      Rails.logger.debug("#{e}/n#{response.inspect}/n#{donation.inspect}")
    end

    private

    def valid?
      return false unless donation

      !donation.paid? && donation.amount.to_f == response.amount.to_f
    end

    def donation
      @donation ||= Donation.by_id(response.order_id).first
    end

    def response
      @response ||= Liqpay::Response.new(params)
    end
  end
end
