class DonationsController < PublicController
  helper_method :donation

  def create
    if donation.save
      Liqpay::PaymentService.handle(donation, self)
    end
  end

  private

  def donation
    @donation ||= Donation.new(donation_params)
  end

  def donation_params
    params.require(:donation).permit(:amount)
  end
end
