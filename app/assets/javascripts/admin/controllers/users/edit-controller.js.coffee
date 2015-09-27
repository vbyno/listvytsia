angular.module('admin.controllers')
.controller('UsersEditController', ['$http', '$location', '$routeParams', ($http, $location, $routeParams) ->
  controller = this;
  controller.user = { email: '', role_ids: [] };
  controller.allRoles = [];

  $http.get("/admin/roles").success((data) ->
    controller.allRoles = data;
  );

  $http.get("/admin/users/#{$routeParams.id}").success((data) ->
    controller.user = data;
  );

  @updateUser = () ->
    $http.put("/admin/users/#{controller.user.id}", @_userParams()).success( ->
      $location.path('/users');
    );

  @_userParams = () ->
    user: {
      email: controller.user.email
      role_ids: controller.user.role_ids
    };

  controller;
]);
