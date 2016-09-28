angular.module('admin.controllers')
.controller('ChunksEditController', ['$http', '$location', '$routeParams', ($http, $location, $routeParams) ->
  controller = this;
  controller.chunk = { identifier: '', body: '' };

  $http.get("/admins/chunks/#{$routeParams.id}").success((data) ->
    controller.chunk = data;
  );

  @updateChunk = () ->
    $http.put("/admins/chunks/#{controller.chunk.id}", @_chunkParams()).success( ->
      $location.path('/chunks');
    );

  @locationPath = () ->
    "##{$location.path()}";

  @readonlyIdentifier = () ->
    true

  @_chunkParams = () ->
    chunk: {
      identifier: controller.chunk.identifier,
      body: controller.chunk.body
    };

  @_deleteChunkParams = (chunk) ->
    chunk: {
      id: chunk.id,
    };

  controller;
]);
