angular.module('admin.controllers')
.controller('RolesIndexController', ['$http', ($http) ->
  controller = this;
  controller.roles = [];

  $http.get('/admins/roles').then((response) ->
    controller.roles = response.data;
  );

  @deleteRole = (role) ->
    role = role
    $http.delete("/admins/roles/#{role.id}").then((response) ->
      controller.roles.splice(controller.roles.indexOf(role), 1);
    );

  controller;
]);
