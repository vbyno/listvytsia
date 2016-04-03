PicturesTableController = ($http) ->
  ctrl = this

  ctrl.pictures = []

  $http.get("/pictures/pictures.json&page_id=#{ctrl.pageId}").success((data) ->
    ctrl.pictures = data
  )

PicturesTableController.$inject = ['$http']

do () ->
  angular.module('pictures').component 'picturesTableComponent',
    templateUrl: 'pictures/pictures-table.template.html',
    controller: PicturesTableController,
    bindings:
      pageId: '@'

