PictureRowController = ($http) ->
  ctrl = this

PictureRowController.$inject = ['$http']

do () ->
  angular.module('pictures').component('pictureRowComponent',
    templateUrl: 'pictures/picture-row.template.html',
    controller: PictureRowController,
    bindings:
      picture: '<'
  )
