angular.module('admin.controllers')
.controller('RolesIndexController', ($http) ->
  controller = this;
  controller.roles = [];

  $http.get('/admin/roles').success((data) ->
    controller.roles = data;
  );

  @deleteRole = (role) ->
    $http.delete("/admin/roles/#{role.id}").success((data) ->
      console.log(data);
    );

  controller;
);
