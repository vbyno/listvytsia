class DonationsController < PublicController
  protect_from_forgery except: :confirm

  helper_method :donation

  def create
    donation.save
  end

  def confirm
    if liqpay_response.success? &&
      liqpay_response.order_id == ACTUAL_ORDER_ID &&
      liqpay_reponse.amount == EXPECTED_AMOUNT
    else

    end
  rescue Liqpay::InvalidResponse
    redirect_to donate_url
  end

  private

  def donation
    @donation ||= Donation.new(donation_params)
  end

  def donation_params
    params.require(:donation).permit(:amount)
  end

  def liqpay_response
    @liqpay_response ||= Liqpay::Response.new(params)
  end
end
