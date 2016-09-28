angular.module('admin.controllers')
.controller('ChunksNewController', ['$http', '$location', ($http, $location) ->
  controller = this;
  controller.chunk = { identifier: '', body: '' };

  @createChunk = () ->
    $http.post('/admins/chunks', @_chunk_params()).success( ->
      $location.path('/chunks');
    );

  @readonlyIdentifier = () ->
    false

  @_chunk_params = () ->
    chunk: {
      identifier: controller.chunk.identifier,
      body: controller.chunk.body
    }

  @locationPath = () ->
    "##{$location.path()}"

  controller;
]);
