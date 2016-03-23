'use strict'

angular.module('pictures', ['templates']);

# This will cause app to compile when Turbolinks loads a new page
# and removes the need for ng-app in the DOM
$(document).on 'ready page:load', ->
  angular.bootstrap(document, ['pictures'], { strictDi: true })

