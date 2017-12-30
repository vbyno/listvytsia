angular.module('admin.controllers')
.controller('CalendarItemsIndexController', ['$scope', '$http', ($scope, $http) ->
  controller = this;
  $scope.calendar_items = [];

  $http.get('/admins/items').then((response) ->
    $scope.calendar_items = response.data;
  );

  $scope.displayed_calendar_items = [].concat($scope.calendar_items);

  @deleteCalendarItem = (calendar_item) ->
    if confirm('Видалити запис із календаря?')
      $http.delete("/admins/items/#{calendar_item.id}").then((response) ->
        $scope.calendar_items.splice($scope.calendar_items.indexOf(calendar_item), 1);
      );

  controller;
]);
