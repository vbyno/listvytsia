require 'liqpay'

module Liqpay
  class PaymentService
    attr_reader :donation, :controller

    delegate :donate_url, :liqpay_execute_url, to: :controller

    def self.handle(*atrs)
      new(*atrs).handle
    end

    def initialize(donation, controller)
      @donation = donation
      @controller = controller
    end

    def handle
      # tODO
      raise NotImplementedError
    end

    def liqpay_request
      @liqpay_request ||=
        Liqpay::Request.new(amount: donation.amount.to_s,
                            currency: donation.amount.currency.to_s,
                            order_id: donation.id.to_s,
                            description: Donation.model_name.human,
                            result_url: donate_url,
                            server_url: liqpay_execute_url)
    end
  end
end
