class StaticPagesController < PublicController
  def contacts
    @contact_form = ContactForm.new
  end
end
