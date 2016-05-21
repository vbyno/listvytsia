require_relative 'base_controller'

module AppComponent
  module Admins
    class UsersController < BaseController
      respond_to :json
      helper_method :users, :user

      def index; end
      def show; end

      def create
        user.save
      end

      def update
        user.update_attributes(user_params)
      end

      private

      def users
        @users ||= User.all
      end

      def user
        @user ||= params[:id] ? users.find(params[:id]) : users.new(user_params)
      end

      def user_params
        params.require(:user).permit(:email, role_ids: [])
      end
    end
  end
end
