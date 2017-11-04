MicroGroupsDashboardController = ($http) ->
  ctrl = this
  ctrl.micro_groups = []

  ctrl.addMicroGroup = () ->
    ctrl.micro_groups.push({editable: true})

  ctrl.loadMicroGroups = ->
    $http.get('/micro_groups.json').then (response) ->
      ctrl.micro_groups = response.data

  ctrl.loadMicroGroups()
  ctrl

MicroGroupsDashboardController.$inject = ['$http']

do () ->
  angular.module('micro_groups').component 'micro_groupsDashboardComponent',
    templateUrl: 'micro_groups/micro_groups-dashboard.template.html',
    controller: MicroGroupsDashboardController
    bindings:
      micro_groups: '&'
      deleteMicroGroup: '&'
      editable: '<'
