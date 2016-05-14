angular.module('admin.controllers')
.controller('StaticPagesIndexController', ['$http', ($http) ->
  controller = this;
  controller.staticPages = [];

  $http.get('/admins/static_pages').success((data) ->
    controller.staticPages = data;
  );

  controller;
]);
