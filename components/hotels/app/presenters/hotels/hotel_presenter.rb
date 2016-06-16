module Hotels
  class HotelPresenter < Core::BasePresenter
    presents :hotel

    def id
      hotel.id.to_s
    end
  end
end
