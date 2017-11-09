angular.module('admin.controllers')
.controller('RegionsEditController', ['$http', '$location', '$routeParams', ($http, $location, $routeParams) ->
  controller = this;
  controller.region = {
    name: '',
    info: '',
    permalink: '',
    priority: 1,
    published: true,
    calendar_url: null
  };

  $http.get("/admins/regions/#{$routeParams.id}").then((response) ->
    controller.region = response.data;
  );

  @updateRegion = () ->
    $http.put("/admins/regions/#{controller.region.id}", @_params())
    .then((response) ->
      if response.data.errors
        controller.errors = response.data.errors
      else
        $location.path('/regions')
    )

  @locationPath = () ->
    "##{$location.path()}";

  @readonlyIdentifier = () ->
    true

  @_params = () ->
    region: {
      name: controller.region.name,
      info: controller.region.info,
      permalink: controller.region.permalink,
      priority: controller.region.priority,
      published: controller.region.published,
      calendar_url: controller.region.calendar_url
    }

  @_deleteRegionParams = (region) ->
    region: {
      id: region.id,
    };

  controller;
]);
