PicturesTableController = ($http) ->
  ctrl = this
  ctrl.pictures = []

  ctrl.updatePicture = (picture, field, value) ->
    params = {}
    params[field] = value

    $http.put("/pictures/pictures/#{picture.id}.json",
      picture: params
    ).then (response) ->
      picture[field] = value

  ctrl.deletePicture = (picture) ->
    $http.delete("/pictures/pictures/#{picture.id}.json"
    ).then (response) ->
      ctrl.pictures.splice(ctrl.pictures.indexOf(picture), 1)

  ctrl.addPicture = (picture) ->
    ctrl.pictures.push(picture)

  ctrl.loadPictures = ->
    $http.get('/pictures/pictures.json',
      params:
        page_id: ctrl.pageId
    ).then (response) ->
      ctrl.pictures = response.data

  ctrl.loadPictures()
  ctrl

PicturesTableController.$inject = ['$http']

do () ->
  angular.module('pictures').component 'picturesTableComponent',
    templateUrl: 'pictures/pictures-table.template.html',
    controller: PicturesTableController,
    bindings:
      pageId: '@'
      uploadUrl: '@'
