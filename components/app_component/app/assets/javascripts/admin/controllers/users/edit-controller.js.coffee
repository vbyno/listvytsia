angular.module('admin.controllers')
.controller('UsersEditController', ['$http', '$location', '$routeParams', ($http, $location, $routeParams) ->
  controller = this;
  controller.user = { email: '', role_ids: [] };
  controller.allRoles = [];

  $http.get("/admins/roles").success((data) ->
    controller.allRoles = data;
  );

  $http.get("/admins/users/#{$routeParams.id}").success((data) ->
    controller.user = data;
  );

  @updateUser = () ->
    $http.put("/admins/users/#{controller.user.id}", @_userParams()).success( ->
      $location.path('/users');
    );

  @_userParams = () ->
    user: {
      email: controller.user.email,
      role_ids: controller.user.role_ids
    };

  controller;
]);
