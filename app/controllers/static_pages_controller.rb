class StaticPagesController < PublicController
  def contacts
    @contact_form = ContactForm.new
  end

  def donate
    return unless donation

    if donation.paid?
      flash.now[:notice] = t('.confirmed')
    else
      flash.now[:error] = t('.not_confirmed')
    end
  end

  private

  def donation
    @donation ||= Donation.by_id(params[:donation_id]).first
  end
end
