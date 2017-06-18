module Core
  class ApplicationController < ::ActionController::Base
    include ::Pundit

    protect_from_forgery with: :exception
    after_action :set_csrf_cookie_for_ng

    rescue_from ::Pundit::NotAuthorizedError, with: :user_not_authorized

    helper_method :pundit_user

    layout 'application'

    protected

    def pundit_user
      UserDecorators.build(current_user)
    end

    def verified_request?
      super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
    end

    private

    def set_csrf_cookie_for_ng
      cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
    end

    def user_not_authorized
      flash[:alert] = t('error_messages.not_authorized')
      redirect_to core.root_path
    end
  end
end
