CalendarController = ($http, $scope) ->
  ctrl = this
  $scope.items = []

  ctrl.loadCalendar = ->
    $http.get('/calendar.json').then (response) ->
      $scope.items = response.data

  $scope.search = (item) ->
    if ctrl.cityName
      return(item.city == ctrl.cityName)

    (!$scope.query ||
      ("#{ item.name }
        #{ item.city }
        #{ item.leaders }
        #{ item.idea }".toLowerCase().indexOf($scope.query.toLowerCase()) != -1)) &&
    (!$scope.city_search || $scope.city_search == 'Всі міста' || $scope.city_search == item.city)

  ctrl.loadCalendar()
  ctrl

CalendarController.$inject = ['$http', '$scope']

do () ->
  angular.module('calendar').component 'generalCalendarComponent',
    templateUrl: 'calendar/calendar-index.template.html',
    controller: CalendarController
    bindings:
      items: '&'
      searchable: '<'
      cityName: '@'
