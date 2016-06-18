HotelsDashboardController = ($http) ->
  ctrl = this
  ctrl.hotels = []

  ctrl.updateHotel = (hotel, field, value) ->
    params = {}
    params[field] = value

    $http.put("/hotels/hotels/#{hotel.id}.json",
      hotel: params
    ).success (data) ->
      hotel[field] = value

  ctrl.deleteHotel = (hotel) ->
    $http.delete("/hotels/hotels/#{hotel.id}.json"
    ).success (data) ->
      ctrl.hotels.splice(ctrl.hotels.indexOf(hotel), 1)

  ctrl.addHotel= (hotel) ->
    ctrl.hotels.push(hotel)

  ctrl.loadHotels = ->
    $http.get(
      '/hotels/hotels.json'
    ).success (data) ->
      ctrl.hotels = data

  ctrl.loadHotels()
  ctrl

HotelsDashboardController.$inject = ['$http']

do () ->
  angular.module('hotels').component 'hotelsDashboardComponent',
    templateUrl: 'hotels/hotels-dashboard.template.html',
    controller: HotelsDashboardController
