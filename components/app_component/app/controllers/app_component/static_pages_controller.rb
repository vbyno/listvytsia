require_relative 'public_controller'

module AppComponent
  class StaticPagesController < PublicController
    helper_method :static_page

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

    def static_pages
      @static_pages ||= StaticPage.published
    end

    def static_page
      @static_page ||= static_pages.where(permalink: action_name).first || StaticPages::MissedModel.instance
    end
  end
end