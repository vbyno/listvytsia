HotelInfoController = () ->
  ctrl = this
  ctrl

do () ->
  angular.module('hotels').component 'hotelInfoComponent',
    templateUrl: 'hotels/hotel-info.template.html',
    controller: HotelInfoController,
    bindings:
      hotel: '='
      editable: '<'
