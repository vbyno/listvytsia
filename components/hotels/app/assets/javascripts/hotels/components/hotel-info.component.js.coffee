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
    $http.put("/hotels/#{hotel.id}", @_hotelParams(hotel)).success( ->
      ctrl.turnEditModeOff(hotel.id)
    );

  @_hotelParams = (hotel) ->
    hotel:
      title: hotel.title

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
