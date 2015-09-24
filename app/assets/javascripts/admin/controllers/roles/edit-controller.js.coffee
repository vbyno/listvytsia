angular.module('admin.controllers')
.controller('RolesEditController', ['$http', '$location', '$routeParams', ($http, $location, $routeParams) ->
  controller = this;
  controller.role = { title: '', permissions: [] };

  $http.get("/admin/roles/#{$routeParams.id}").success((data) ->
    controller.role = data;
  );

  @updateRole = () ->
    $http.put("/admin/roles/#{controller.role.id}", @_roleParams()).success( ->
      $location.path('/roles');
    );

  @newPermission = () ->
    controller.role.permissions.push({});

  @deletePermission = (permission) ->
    controller.role.permissions.splice(controller.role.permissions.indexOf(permission), 1);

  @_roleParams = () ->
    role: {
      title: controller.role.title,
      permissions_attributes: controller.role.permissions
    };

  @locationPath = () ->
    "##{$location.path()}";

  controller;
]);
