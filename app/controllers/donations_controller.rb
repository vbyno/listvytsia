class DonationsController < PublicController
  protect_from_forgery except: :confirm

  helper_method :donation

  def create
    donation.save
  end

  def confirm
    if liqpay_responder.valid?
      liqpay_responder.donation.confirm!
      flash[:notice] = t('.confirmed')
    else
      flash[:error] = t('.not_confirmed', error: liqpay_responder.errors.full_messages.to_sentence)
    end
  rescue Liqpay::InvalidResponse
    flash[:error] = t('.fail')
  end

  private

  def donation
    @donation ||= Donation.new(donation_params)
  end

  def donation_params
    params.require(:donation).permit(:amount)
  end

  def liqpay_responder
    @liqpay_responder ||= Liqpay::Responder.new(params)
  end
end
