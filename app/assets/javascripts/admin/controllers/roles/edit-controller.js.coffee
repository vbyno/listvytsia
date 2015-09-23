angular.module('admin.controllers')
.controller('RolesEditController', ['$http', '$location', '$routeParams', ($http, $location, $routeParams) ->
  controller = this;
  controller.role = {};

  $http.get("/admin/roles/#{$routeParams.id}").success((data) ->
    controller.role = data;
  );

  @updateRole = () ->
    $http.put("/admin/roles/#{controller.role.id}", controller.role).success( ->
      $location.path('/roles');
    );

  controller;
]);
