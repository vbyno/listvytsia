MicroGroupInfoController = ($http) ->
  ctrl = this

  ctrl.turnEditModeOn = () ->
    ctrl.editMode = true

  ctrl.turnEditModeOff = () ->
    ctrl.editMode = false

  ctrl.updateMicroGroup = () ->
    $http.put("/micro_groups/#{ctrl.micro_group.id}.json", @_micro_groupParams()).then( ->
      ctrl.turnEditModeOff()
    );

  ctrl.createMicroGroup = () ->
    $http.post("/micro_groups", @_micro_groupParams()).then((response) ->
      ctrl.micro_group.id = response.data.id
      ctrl.turnEditModeOff()
    );

  ctrl.deleteMicroGroup = () ->
    $http.delete("/micro_groups/#{ctrl.micro_group.id}.json").then (response) ->
      ctrl.micro_group.deleted = true

  @_micro_groupParams = () ->
    micro_group:
      title: ctrl.micro_group.title
      link: ctrl.micro_group.link
      address: ctrl.micro_group.address
      phone: ctrl.micro_group.phone
      price: ctrl.micro_group.price
      published: ctrl.micro_group.published

  ctrl

MicroGroupInfoController.$inject = ['$http']

do () ->
  angular.module('micro_groups').component 'micro_groupInfoComponent',
    templateUrl: 'micro_groups/micro_group-info.template.html',
    controller: MicroGroupInfoController,
    bindings:
      micro_group: '='
      editable: '<'
