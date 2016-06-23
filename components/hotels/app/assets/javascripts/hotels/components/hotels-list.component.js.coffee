HotelsListController = ($http) ->
  ctrl = this
  ctrl.hotels = []

  ctrl.loadHotels = ->
    $http.get(
      '/hotels.json?published=1'
    ).success (data) ->
      ctrl.hotels = data

  ctrl.loadHotels()
  ctrl

HotelsListController.$inject = ['$http']

do () ->
  angular.module('hotels').component 'hotelsListComponent',
    templateUrl: 'hotels/hotels-list.template.html',
    controller: HotelsListController
    bindings:
      hotels: '&'
