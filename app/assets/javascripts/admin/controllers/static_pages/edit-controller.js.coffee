angular.module('admin.controllers')
.controller('StaticPagesEditController', ['$http', '$location', '$routeParams', ($http, $location, $routeParams) ->
  controller = this;
  controller.staticPage = { permalink: '', title: '', content: '', published: false };
  controller.staticPage.seo_content = { title: '', description: '', keywords: '' };

  $http.get("/admin/static_pages/#{$routeParams.id}").success((data) ->
    controller.staticPage = data;
  );

  @updateStaticPage = () ->
    $http.put("/admin/static_pages/#{controller.staticPage.id}", @_staticPageParams()).success( ->
      $location.path('/static_pages');
    );

  @locationPath = () ->
    "##{$location.path()}";

  @_staticPageParams = () ->
    static_page: {
      permalink: controller.staticPage.permalink,
      title:     controller.staticPage.title,
      content:   controller.staticPage.content,
      published: controller.staticPage.published,
      seo_content_attributes: controller.staticPage.seo_content
    };

  controller;
]);
