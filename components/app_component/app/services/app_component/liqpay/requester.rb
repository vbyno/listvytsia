module AppComponent
  module Liqpay
    class Requester
      attr_reader :donation, :context

      delegate :amount, to: :donation
      delegate :donate_url, :confirm_donations_url, to: :context

      def initialize(donation, context)
        @donation = donation
        @context = context
      end

      def self.request(*atrs)
        new(*atrs).request
      end

      def request
        ::Liqpay::Request.new(amount:      amount,
                              currency:    amount.currency,
                              order_id:    donation.id,
                              description: AppComponent::Donation.model_name.human,
                              result_url:  result_url,
                              server_url:  confirm_donations_url)
      end

      private

      def result_url
        donate_url(donation_id: donation.id)
      end
    end
  end
end
