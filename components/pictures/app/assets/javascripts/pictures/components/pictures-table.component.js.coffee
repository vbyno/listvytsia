PicturesTableController = ($http) ->
  ctrl = this
  ctrl.pictures = []

  ctrl.updatePicture = (picture, field, value) ->
    params = {}
    params['picture'] = {}
    params['picture'][field] = value

    $http.put("/pictures/pictures/#{picture.id}.json",
      params
    ).success (data) ->
      picture[field] = value

  $http.get('/pictures/pictures.json',
    params:
      page_id: ctrl.pageId
  ).success (data) ->
    ctrl.pictures = data

  ctrl

PicturesTableController.$inject = ['$http']

do () ->
  angular.module('pictures').component 'picturesTableComponent',
    templateUrl: 'pictures/pictures-table.template.html',
    controller: PicturesTableController,
    bindings:
      pageId: '@'
