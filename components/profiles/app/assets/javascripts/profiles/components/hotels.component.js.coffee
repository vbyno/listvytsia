ProfilesController = () ->
  ctrl = this

  ctrl.turnEditModeOn = () ->
    ctrl.editMode = true

  ctrl.turnEditModeOff = () ->
    ctrl.editMode = false

  ctrl.showCheckButton = () ->
    ctrl.editable && ctrl.editMode

  ctrl.showEditButton =() ->
    ctrl.editable && !ctrl.editMode

  ctrl

do () ->
  angular.module('profiles').component 'profilesComponent',
    templateUrl: 'profiles/profiles.template.html',
    controller: ProfilesController,
    bindings:
      editable: '<'
      editMode: '<'
