angular.module('admin.controllers')
.controller('RegionsNewController', ['$http', '$location', ($http, $location) ->
  controller = this;
  controller.region = {
    name: '',
    info: '',
    permalink: '',
    priority: 1,
    published: true,
    calendar_url: null,
    additional_calendar_url: null
  };

  @createRegion = () ->
    $http.post('/admins/regions', @_params()).then( ->
      $location.path('/regions');
    );

  @readonlyIdentifier = () ->
    false

  @_params = () ->
    region: {
      name: controller.region.name,
      info: controller.region.info,
      permalink: controller.region.permalink,
      priority: controller.region.priority,
      published: controller.region.published,
      calendar_url: controller.region.calendar_url,
      additional_calendar_url: controller.region.additional_calendar_url
    }

  @locationPath = () ->
    "##{$location.path()}"

  controller;
]);
