angular.module('admin.controllers')
.controller('UsersEditController', ['$http', '$location', '$routeParams', ($http, $location, $routeParams) ->
  controller = this;
  controller.user = { email: '', role_ids: [] };
  controller.allRoles = [];

  $http.get("/admins/roles").then((response) ->
    controller.allRoles = response.data;
  );

  $http.get("/admins/users/#{$routeParams.id}").then((response) ->
    controller.user = response.data;
  );

  @updateUser = () ->
    $http.put("/admins/users/#{controller.user.id}", @_userParams()).then( ->
      $location.path('/users');
    );

  @_userParams = () ->
    user: {
      email: controller.user.email,
      role_ids: controller.user.role_ids
    };

  controller;
]);
