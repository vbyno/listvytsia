angular.module('admin.controllers')
.controller('RolesIndexController', ($http) ->
  controller = this;
  controller.roles = [];
  $http({method: 'GET', url: '/admin/roles'}).success((data) ->
    controller.roles = data;
  );
  controller;
);
