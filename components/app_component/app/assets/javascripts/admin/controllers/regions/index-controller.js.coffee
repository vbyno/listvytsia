angular.module('admin.controllers')
.controller('RegionsIndexController', ['$scope', '$http', ($scope, $http) ->
  controller = this;
  $scope.regions = [];

  $http.get('/admins/regions').then((response) ->
    $scope.regions = response.data;
  );

  $scope.displayed_regions = [].concat($scope.regions);

  @deleteRegion = (region) ->
    if confirm('Видалити інформацію про регіон?')
      $http.delete("/admins/regions/#{region.id}").then((response) ->
        $scope.regions.splice($scope.regions.indexOf(region), 1);
      );

  controller;
]);
