angular.module('admin.controllers')
.controller('MicroGroupsIndexController', ['$http', ($http) ->
  controller = this;
  controller.micro_groups = [];

  $http.get('/admins/micro_groups').then((response) ->
    controller.micro_groups = response.data;
  );

  @deleteMicroGroup = (micro_group) ->
    if confirm('Видалити інформацію про мікрогрупу?')
      $http.delete("/admins/micro_groups/#{micro_group.id}").then((response) ->
        controller.micro_groups.splice(controller.micro_groups.indexOf(micro_group), 1);
      );


  controller;
]);
