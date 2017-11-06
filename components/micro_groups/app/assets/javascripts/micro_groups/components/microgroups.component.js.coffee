MicroGroupsController = ($http, $scope) ->
  ctrl = this
  $scope.micro_groups = []

  ctrl.loadMicroGroups = ->
    $http.get('/micro_groups.json').then (response) ->
      $scope.micro_groups = response.data

  $scope.search = (micro_group) ->
    if (!$scope.query ||
      ("#{ micro_group.name }
        #{ micro_group.city }
        #{ micro_group.leaders }
        #{ micro_group.idea }".toLowerCase().indexOf($scope.query.toLowerCase()) != -1)) &&
      (!$scope.city_search || $scope.city_search == 'Всі міста' || $scope.city_search == micro_group.city)
        true
    else
      false

  ctrl.loadMicroGroups()
  ctrl

MicroGroupsController.$inject = ['$http', '$scope']

do () ->
  angular.module('micro_groups').component 'microGroupsComponent',
    templateUrl: 'micro_groups/micro_groups-index.template.html',
    controller: MicroGroupsController
    bindings:
      micro_groups: '&'
