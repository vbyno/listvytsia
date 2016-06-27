HotelsDashboardController = ($http) ->
  ctrl = this
  ctrl.hotels = []

  ctrl.addHotel = () ->
    ctrl.hotels.push({})

  ctrl.loadHotels = ->
    $http.get(
      '/hotels.json'
    ).success (data) ->
      ctrl.hotels = data

  ctrl.loadHotels()
  ctrl

HotelsDashboardController.$inject = ['$http']

do () ->
  angular.module('hotels').component 'hotelsDashboardComponent',
    templateUrl: 'hotels/hotels-dashboard.template.html',
    controller: HotelsDashboardController
    bindings:
      hotels: '&'
      deleteHotel: '&'
