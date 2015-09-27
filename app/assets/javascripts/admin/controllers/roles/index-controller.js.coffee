angular.module('admin.controllers')
.controller('RolesIndexController', ($http) ->
  controller = this;
  controller.roles = [];

  $http.get('/admin/roles').success((data) ->
    controller.roles = data;
  );

  @deleteRole = (role) ->
    role = role
    $http.delete("/admin/roles/#{role.id}").success((data) ->
      controller.roles.splice(controller.roles.indexOf(role), 1);
    );

  controller;
);
