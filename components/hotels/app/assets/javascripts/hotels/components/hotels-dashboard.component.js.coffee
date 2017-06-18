HotelsDashboardController = ($http) ->
  ctrl = this
  ctrl.hotels = []

  ctrl.addHotel = () ->
    ctrl.hotels.push({editable: true})

  ctrl.loadHotels = ->
    $http.get('/hotels.json').then (response) ->
      ctrl.hotels = response.data

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
