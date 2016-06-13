module Core
  class ApplicationController < ::ActionController::Base
    include ::Pundit

    protect_from_forgery with: :exception

    rescue_from ::Pundit::NotAuthorizedError, with: :user_not_authorized

    helper_method :pundit_user

    layout 'core/public'

    private

    def pundit_user
      current_user || MissedUser.instance
    end

    def user_not_authorized
      flash[:alert] = t('error_messages.not_authorized')
      redirect_to core.root_path
    end
  end
end
