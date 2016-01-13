module Liqpay
  module Requester
    def self.request(donation, context)
      Liqpay::Request.new(amount:      donation.amount.to_s,
                          currency:    donation.amount.currency.to_s,
                          order_id:    donation.id.to_s,
                          description: Donation.model_name.human,
                          result_url:  context.donate_url,
                          server_url:  context.confirm_donations_url)
    end
  end
end
