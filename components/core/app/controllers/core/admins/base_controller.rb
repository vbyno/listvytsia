module Core
  module Admins
    class BaseController < ::Core::ApplicationController
      before_action :authenticate_admin!
      layout 'admin'

      after_filter :set_csrf_cookie_for_ng

      rescue_from ActionController::InvalidAuthenticityToken do |exception|
        sign_out(current_admin)
        set_csrf_cookie_for_ng
        render({ error: 'invalid token' }, { status: :unprocessable_entity })
      end

      def set_csrf_cookie_for_ng
        cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
      end

      protected

      def verified_request?
        super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
      end
    end
  end
end
