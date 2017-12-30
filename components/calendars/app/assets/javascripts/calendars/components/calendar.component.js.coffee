CalendarController = ($http, $scope) ->
  ctrl = this
  $scope.micro_groups = []

  ctrl.loadCalendars = ->
    $http.get('/micro_groups.json').then (response) ->
      $scope.micro_groups = response.data

  $scope.search = (item) ->
    if ctrl.cityName
      return(item.city == ctrl.cityName)

    (!$scope.query ||
      ("#{ item.name }
        #{ item.city }
        #{ item.leaders }
        #{ item.idea }".toLowerCase().indexOf($scope.query.toLowerCase()) != -1)) &&
    (!$scope.city_search || $scope.city_search == 'Всі міста' || $scope.city_search == item.city)

  ctrl.loadCalendars()
  ctrl

CalendarsController.$inject = ['$http', '$scope']

do () ->
  angular.module('micro_groups').component 'microGroupsComponent',
    templateUrl: 'micro_groups/micro_groups-index.template.html',
    controller: CalendarsController
    bindings:
      micro_groups: '&'
      searchable: '<'
      cityName: '@'
