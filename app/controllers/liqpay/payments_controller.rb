class Liqpay::PaymentsController < ::PublicController
  protect_from_forgery except: :execute

  def execute
    if liqpay_response.success? &&
        liqpay_response.order_id == ACTUAL_ORDER_ID &&
        liqpay_reponse.amount == EXPECTED_AMOUNT
    else

    end
  rescue Liqpay::InvalidResponse
    redirect_to donate_url
  end

  private

  def liqpay_response
    @liqpay_response ||= Liqpay::Response.new(params)
  end
end
