CalendarController = ($http, $scope, $sce) ->
  ctrl = this
  $scope.items = []
  $scope.displayed_calendar_items = []

  $scope.renderHtml = (html_code) ->
    $sce.trustAsHtml(html_code);

  ctrl.loadCalendar = ->
    $http.get('/calendar.json').then (response) ->
      $scope.items = response.data
      $scope.displayed_calendar_items = [].concat($scope.items);

  $scope.search = (item) ->
    (!$scope.query ||
      ("#{ item.course }
        #{ item.city }
        #{ item.contacts }
        #{ item.dates }".toLowerCase().indexOf($scope.query.toLowerCase()) != -1)) &&
    ($scope.city_search == 'Всі' || $scope.city_search == item.city)

  ctrl.loadCalendar()
  ctrl

CalendarController.$inject = ['$http', '$scope', '$sce']

do () ->
  angular.module('calendar').component 'generalCalendarComponent',
    templateUrl: 'calendar/calendar-index.template.html',
    controller: CalendarController
    bindings:
      items: '&'
      searchable: '<'
