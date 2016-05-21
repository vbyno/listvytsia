angular.module('admin.controllers')
.controller('RolesIndexController', ['$http', ($http) ->
  controller = this;
  controller.roles = [];

  $http.get('/admins/roles').success((data) ->
    controller.roles = data;
  );

  @deleteRole = (role) ->
    role = role
    $http.delete("/admins/roles/#{role.id}").success((data) ->
      controller.roles.splice(controller.roles.indexOf(role), 1);
    );

  controller;
]);
