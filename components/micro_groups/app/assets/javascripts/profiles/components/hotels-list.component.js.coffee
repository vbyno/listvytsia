MicroGroupsListController = ($http) ->
  ctrl = this
  ctrl.micro_groups = []

  ctrl.loadMicroGroups = ->
    $http.get('/micro_groups.json?published=1').then (response) ->
      ctrl.micro_groups = response.data

  ctrl.loadMicroGroups()
  ctrl

MicroGroupsListController.$inject = ['$http']

do () ->
  angular.module('micro_groups').component 'micro_groupsListComponent',
    templateUrl: 'micro_groups/micro_groups-list.template.html',
    controller: MicroGroupsListController
    bindings:
      micro_groups: '&'
