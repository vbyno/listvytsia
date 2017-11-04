angular.module('admin.controllers')
.controller('MicroGroupsNewController', ['$http', '$location', ($http, $location) ->
  controller = this;
  controller.micro_group = {
    name: '',
    city: '',
    idea: '',
    leaders: '',
    contacts: '',
    methodologies: ''
  };

  @createMicroGroup = () ->
    $http.post('/admins/micro_groups', @_microGroupParams()).then( ->
      $location.path('/micro_groups');
    );

  @readonlyIdentifier = () ->
    false

  @_microGroupParams = () ->
    micro_group: {
      name: controller.micro_group.name,
      city: controller.micro_group.city,
      idea: controller.micro_group.idea,
      leaders: controller.micro_group.leaders,
      contacts: controller.micro_group.contacts,
      methodologies: controller.micro_group.methodologies
    }

  @locationPath = () ->
    "##{$location.path()}"

  controller;
]);
