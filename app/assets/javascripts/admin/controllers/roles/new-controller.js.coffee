angular.module('admin.controllers')
.controller('RolesNewController', ['$http', '$location', ($http, $location) ->
  controller = this;
  controller.role = { title: '', permissions: [] };

  @createRole = () ->
    $http.post("/admin/roles", @_role_params()).success( ->
      $location.path('/roles');
    );

  @newPermission = () ->
    controller.role.permissions.push({});

  @deletePermission = (permission) ->
    controller.role.permissions.splice(controller.role.permissions.indexOf(permission), 1);

  @_role_params = () ->
    role: {
      title: controller.role.title,
      permissions_attributes: controller.role.permissions
    }

  @locationPath = () ->
    "##{$location.path()}"

  controller;
]);
