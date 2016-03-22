do () ->
  angular.module('pictures').component('picturesListComponent',
    templateUrl: '/pictures/components/pictures-list.template.html',
    controller: PicturesListController,
    bindings:
      hero: '<',
      onDelete: '&',
      onUpdate: '&'
  );

  PicturesListController = () ->
    ctrl = this

    ctrl.update = (prop, value) ->
      ctrl.onUpdate({hero: ctrl.hero, prop: prop, value: value})
