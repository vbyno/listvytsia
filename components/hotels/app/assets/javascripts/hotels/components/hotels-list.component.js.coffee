HotelsListController = ($http) ->
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

HotelsListController.$inject = ['$http']

do () ->
  angular.module('hotels').component 'hotelsListComponent',
    templateUrl: 'hotels/hotels-list.template.html',
    controller: HotelsListController
