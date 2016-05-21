require_relative 'public_controller'

module AppComponent
  class DonationsController < PublicController
    protect_from_forgery except: :confirm

    helper_method :donation

    def create
      donation.save
    end

    def confirm
      liqpay_responder.confirm
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
end