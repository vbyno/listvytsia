require_relative 'application_controller'

module Hotels
  class HotelsController < ApplicationController
    respond_to :json

    helper_method :hotel

    def index; end
    def create; end

    def update
      hotel.update_attributes(picture_params)
    end

    def destroy
      hotel.destroy
    end

    private

    def hotel_params
      params.require(:hotel).permit(:page_id, :alt, :title, :data)
    end

    def hotels
      @hotels ||= policy_scope(Hotels::Hotel)
    end

    def hotel
      @hotel ||= params[:id] ? Hotel.find(params[:id]) : Picture.create(picture_params)
    end
  end
end
