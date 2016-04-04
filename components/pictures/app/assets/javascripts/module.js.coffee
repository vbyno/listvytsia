'use strict'

angular.module('pictures', ['templates', 'ngFileUpload'])
angular.module('pictures').config(['$compileProvider', ($compileProvider) ->
  $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|javascript):/)
])

# This will cause app to compile when Turbolinks loads a new page
# and removes the need for ng-app in the DOM
$(document).on 'ready page:load', ->
  angular.bootstrap(document, ['pictures'], { strictDi: true })

