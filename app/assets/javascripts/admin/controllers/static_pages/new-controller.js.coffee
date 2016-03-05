angular.module('admin.controllers')
.controller('StaticPagesNewController', ['$http', '$location', ($http, $location) ->
  controller = this;
  controller.staticPage = { permalink: '', title: '', content: '', published: false };

  @createStaticPage = () ->
    $http.post("/admin/static_pages", @_staticPageParams()).success( ->
      $location.path('/static_pages');
    );

  @_staticPageParams = () ->
    static_page: {
      permalink: controller.staticPage.permalink,
      title:     controller.staticPage.title,
      content:   controller.staticPage.content,
      published: controller.staticPage.published
    };

  @locationPath = () ->
    "##{$location.path()}"

  controller;
]);
