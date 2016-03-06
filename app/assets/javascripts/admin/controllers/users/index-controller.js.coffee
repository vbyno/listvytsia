angular.module('admin.controllers')
.controller('UsersIndexController', ['$http', ($http) ->
  controller = this;
  controller.users = [];

  $http.get('/admin/users').success((data) ->
    controller.users = data;
  );

  controller;
]);
