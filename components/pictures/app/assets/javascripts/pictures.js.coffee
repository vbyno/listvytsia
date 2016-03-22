'use strict'

angular.module('pictures', ['templates']);

# This will cause app to compile when Turbolinks loads a new page
# and removes the need for ng-app in the DOM
$(document).on('ready page:load', ->
  angular.bootstrap(document, ['pictures'], { strictDi: true })
);

#= require_tree ./pictures

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
