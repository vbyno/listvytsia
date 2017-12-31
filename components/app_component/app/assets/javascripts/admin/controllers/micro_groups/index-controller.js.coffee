angular.module('admin.controllers')
.controller('MicroGroupsIndexController', ['$scope', '$http', ($scope, $http) ->
  controller = this;
  $scope.micro_groups = [];

  $http.get('/admins/micro_groups').then((response) ->
    $scope.micro_groups = response.data;
  );

  $scope.displayed_micro_groups = [].concat($scope.micro_groups);

  @deleteMicroGroup = (micro_group) ->
    if confirm('Видалити інформацію про мікрогрупу?')
      $http.delete("/admins/micro_groups/#{micro_group.id}").then((response) ->
        $scope.micro_groups.splice($scope.micro_groups.indexOf(micro_group), 1);
      );


  controller;
]);
