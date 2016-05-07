angular.module('admin.controllers')
.controller('StaticPagesIndexController', ['$http', ($http) ->
  controller = this;
  controller.staticPages = [];

  $http.get('/admin/static_pages').success((data) ->
    controller.staticPages = data;
  );

  controller;
]);
