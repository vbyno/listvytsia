angular.module('admin.controllers')
.controller('MicroGroupsEditController', ['$http', '$location', '$routeParams', ($http, $location, $routeParams) ->
  controller = this;
  controller.micro_group = { identifier: '', body: '' };

  $http.get("/admins/micro_groups/#{$routeParams.id}").then((response) ->
    controller.micro_group = response.data;
  );

  @updateMicroGroup = () ->
    $http.put("/admins/micro_groups/#{controller.micro_group.id}", @_microGroupParams()).then( ->
      $location.path('/micro_groups');
    );

  @locationPath = () ->
    "##{$location.path()}";

  @readonlyIdentifier = () ->
    true

  @_microGroupParams = () ->
    micro_group: {
      identifier: controller.micro_group.identifier,
      body: controller.micro_group.body
    };

  @_deleteMicroGroupParams = (micro_group) ->
    micro_group: {
      id: micro_group.id,
    };

  controller;
]);
