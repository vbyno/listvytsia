class StaticPagesController < ApplicationController
  def contacts
    @contact_form = ContactForm.new
  end
end
