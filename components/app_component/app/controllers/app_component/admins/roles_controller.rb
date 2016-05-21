require_relative 'base_controller'

module AppComponent
  module Admins
    class RolesController < BaseController
      respond_to :json
      helper_method :roles, :role

      def index; end
      def show; end

      def create
        role.save
      end

      def update
        role.update_attributes(role_params)
      end

      def destroy
        role.destroy
      end

      private

      def roles
        @roles ||= Role.all
      end

      def role
        @role ||= params[:id] ? roles.find(params[:id]) : roles.new(role_params)
      end

      def role_params
        params.require(:role).permit(:title,
                                     permissions_attributes: [:id, :resource, :action, :_destroy])
      end
    end
  end
end