HotelsController = () ->
  ctrl = this
  ctrl.editMode = false

  ctrl.turnEditModeOn = () ->
    ctrl.editMode = true

  ctrl.turnEditModeOff = () ->
    ctrl.editMode = false

  ctrl.isEditable = () ->
    ctrl.editable && !ctrl.editMode

  ctrl

do () ->
  angular.module('hotels').component 'hotelsComponent',
    templateUrl: 'hotels/hotels.template.html',
    controller: HotelsController,
    bindings:
      editable: '<'
      editMode: '&'
