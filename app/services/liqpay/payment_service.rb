require 'liqpay'

module Liqpay
  class PaymentService
    attr_reader :donation, :context

    delegate :donate_url, :confirm_donations_url, to: :context

    def self.request(*args)
      new(*args).request
    end

    def initialize(donation, context)
      @donation = donation
      @context = context
    end

    def request
      @request ||=
        Liqpay::Request.new(amount:      donation.amount.to_s,
                            currency:    donation.amount.currency.to_s,
                            order_id:    donation.id.to_s,
                            description: Donation.model_name.human,
                            result_url:  donate_url,
                            server_url:  confirm_donations_url)
    end
  end
end
