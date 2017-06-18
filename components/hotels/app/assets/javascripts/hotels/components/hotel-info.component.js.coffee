HotelInfoController = ($http) ->
  ctrl = this

  ctrl.turnEditModeOn = (hotel) ->
    hotel.editable = true

  ctrl.turnEditModeOff = (hotel) ->
    hotel.editable = false

  ctrl.updateHotel = (hotel) ->
    $http.put("/hotels/#{hotel.id}.json", @_hotelParams(hotel)).then( ->
      ctrl.turnEditModeOff(hotel)
    );

  ctrl.createHotel = (hotel) ->
    $http.post("/hotels", @_hotelParams(hotel)).then((response) ->
      hotel.id = response.data.id
      ctrl.turnEditModeOff(hotel)
    );

  ctrl.deleteHotel = (hotel) ->
    $http.delete("/hotels/#{hotel.id}.json").then (response) ->
      hotel.deleted = true

  @_hotelParams = (hotel) ->
    hotel:
      title: hotel.title
      link: hotel.link
      address: hotel.address
      phone: hotel.phone
      price: hotel.price
      published: hotel.published

  ctrl

HotelInfoController.$inject = ['$http']

do () ->
  angular.module('hotels').component 'hotelInfoComponent',
    templateUrl: 'hotels/hotel-info.template.html',
    controller: HotelInfoController,
    bindings:
      hotel: '='
      editable: '<'
