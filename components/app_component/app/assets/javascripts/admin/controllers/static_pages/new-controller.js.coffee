angular.module('admin.controllers')
.controller('StaticPagesNewController', ['$http', '$location', ($http, $location) ->
  controller = this;
  controller.staticPage = { permalink: '', title: '', content: '', published: false };
  controller.staticPage.seo_content = { title: '', description: '', keywords: '' };

  @createStaticPage = () ->
    $http.post("/admins/static_pages", @_staticPageParams()).success( ->
      $location.path('/static_pages');
    );

  @_staticPageParams = () ->
    static_page: {
      permalink: controller.staticPage.permalink,
      title:     controller.staticPage.title,
      content:   controller.staticPage.content,
      published: controller.staticPage.published,
      seo_content_attributes: controller.staticPage.seo_content
    };

  @locationPath = () ->
    "##{$location.path()}"

  controller;
]);
