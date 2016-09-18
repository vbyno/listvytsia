'use strict'

angular.module('pictures', [
  'templates',
  'ngFileUpload',
  'uib/template/modal/window.html',
  'uib/template/modal/backdrop.html',
  'angular-confirm'
])
angular.module('pictures').config(['$compileProvider', ($compileProvider) ->
  $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|javascript):/)
])
