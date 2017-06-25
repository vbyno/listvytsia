HotelInfoController = ($http) ->
  ctrl = this

  ctrl.turnEditModeOn = () ->
    ctrl.editMode = true

  ctrl.turnEditModeOff = () ->
    ctrl.editMode = false

  ctrl.updateHotel = () ->
    $http.put("/hotels/#{ctrl.hotel.id}.json", @_hotelParams()).then( ->
      ctrl.turnEditModeOff()
    );

  ctrl.createHotel = () ->
    $http.post("/hotels", @_hotelParams()).then((response) ->
      ctrl.hotel.id = response.data.id
      ctrl.turnEditModeOff()
    );

  ctrl.deleteHotel = () ->
    $http.delete("/hotels/#{ctrl.hotel.id}.json").then (response) ->
      ctrl.hotel.deleted = true

  @_hotelParams = () ->
    hotel:
      title: ctrl.hotel.title
      link: ctrl.hotel.link
      address: ctrl.hotel.address
      phone: ctrl.hotel.phone
      price: ctrl.hotel.price
      published: ctrl.hotel.published

  ctrl

HotelInfoController.$inject = ['$http']

do () ->
  angular.module('hotels').component 'hotelInfoComponent',
    templateUrl: 'hotels/hotel-info.template.html',
    controller: HotelInfoController,
    bindings:
      hotel: '='
      editable: '<'
