class PublicController < ApplicationController
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  layout 'public'

  private

  def user_not_authorized
    flash[:alert] = t('error_messages.not_authorized')
    redirect_to(request.referrer || root_path)
  end
end
