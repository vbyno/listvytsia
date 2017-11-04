MicroGroupsController = () ->
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
  angular.module('micro_groups').component 'micro_groupsComponent',
    templateUrl: 'micro_groups/micro_groups.template.html',
    controller: MicroGroupsController,
    bindings:
      editable: '<'
      editMode: '<'
