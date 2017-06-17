HotelInfoController = ($http) ->
  ctrl = this
  ctrl.editableIds = []

  ctrl.turnEditModeOn = (hotelId) ->
    ctrl.editableIds.push(hotelId)

  ctrl.turnEditModeOff = (hotelId) ->
    ctrl.editableIds.splice(ctrl.editableIds.indexOf(hotelId), 1);

  ctrl.ownEditMode = (hotelId) ->
    ctrl.editableIds.indexOf(hotelId) != -1

  ctrl.updateHotel = (hotel) ->
    $http.put("/hotels/#{hotel.id}.json", @_hotelParams(hotel)).then( ->
      ctrl.turnEditModeOff(hotel.id)
    );

  ctrl.createHotel = (hotel) ->
    $http.post("/hotels", @_hotelParams(hotel)).then((data) ->
      hotel.id = data.id
      ctrl.turnEditModeOff(data.id)
    );

  ctrl.deleteHotel = (hotel) ->
    $http.delete("/hotels/#{hotel.id}.json"
    ).success (data) ->
      ctrl.hotels.splice(ctrl.hotels.indexOf(hotel), 1)

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
      ownEditMode: '&'
