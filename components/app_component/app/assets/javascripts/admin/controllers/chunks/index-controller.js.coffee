angular.module('admin.controllers')
.controller('ChunksIndexController', ['$http', ($http) ->
  controller = this;
  controller.chunks = [];

  $http.get('/admins/chunks').success((data) ->
    controller.chunks = data;
  );

  @deleteChunk = (chunk) ->
    chunk = chunk
    $http.delete("/admins/chunks/#{chunk.id}").success((data) ->
      controller.chunks.splice(controller.chunks.indexOf(chunk), 1);
    );

  controller;
]);
