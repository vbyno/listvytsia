angular.module('admin.controllers')
.controller('MicroGroupsEditController', ['$http', '$location', '$routeParams', ($http, $location, $routeParams) ->
  controller = this;
  controller.micro_group = {
    name: '',
    city: '',
    idea: '',
    leaders: '',
    contacts: '',
    methodologies: ''
  };

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
      name: controller.micro_group.name,
      city: controller.micro_group.city,
      idea: controller.micro_group.idea,
      leaders: controller.micro_group.leaders,
      contacts: controller.micro_group.contacts,
      methodologies: controller.micro_group.methodologies
    }

  @_deleteMicroGroupParams = (micro_group) ->
    micro_group: {
      id: micro_group.id,
    };

  controller;
]);
