angular.module('admin.controllers')
.controller('EventsIndexController', ['$scope', '$http', ($scope, $http) ->
  controller = this;
  $scope.events = [];

  $http.get('/admins/events').then((response) ->
    $scope.events = response.data;
  );

  $scope.displayed_events = [].concat($scope.events);

  @deleteEvent = (event) ->
    if confirm('Видалити подію?')
      $http.delete("/admins/events/#{event.id}").then((response) ->
        $scope.events.splice($scope.events.indexOf(event), 1);
      );

  controller;
]);
