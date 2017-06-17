angular.module('admin.controllers')
.controller('UsersIndexController', ['$http', ($http) ->
  controller = this;
  controller.users = [];

  $http.get('/admins/users').then((response) ->
    controller.users = response.data;
  );

  controller;
]);
