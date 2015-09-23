angular.module('admin.controllers')
.controller('RolesNewController', ['$http', '$location', ($http, $location) ->
  controller = this;
  controller.role = {};

  @createRole = () ->
    $http.post("/admin/roles", controller.role).success( ->
      $location.path('/roles');
    );

  controller;
]);
