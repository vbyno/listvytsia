module Hotels
  class HotelsController < ::Core::ApplicationController
    respond_to :json

    helper_method :hotel, :hotels

    def index; end
    def create; end

    def update
      hotel.update_attributes(hotel_params)
    end

    def destroy
      hotel.destroy
    end

    private

    def hotel_params
      params.require(:hotel).permit(:link, :address, :title, :phone, :price, :published)
    end

    def hotels
      @hotels ||= policy_scope(Hotel)
    end

    def hotel
      @hotel ||= params[:id] ? Hotel.find(params[:id]) : Hotel.create(hotel_params)
    end
  end
end
