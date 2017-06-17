angular.module('admin.controllers')
.controller('ChunksIndexController', ['$http', ($http) ->
  controller = this;
  controller.chunks = [];

  $http.get('/admins/chunks').then((response) ->
    controller.chunks = response.data;
  );

  @deleteChunk = (chunk) ->
    chunk = chunk
    $http.delete("/admins/chunks/#{chunk.id}").then((response) ->
      controller.chunks.splice(controller.chunks.indexOf(chunk), 1);
    );

  controller;
]);
