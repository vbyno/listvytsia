'use strict'

angular.module('profiles', [
  'templates',
  'ngFileUpload',
  'uib/template/modal/window.html',
  'uib/template/modal/backdrop.html',
  'angular-confirm'
])
angular.module('profiles').config(['$compileProvider', ($compileProvider) ->
  $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|javascript):/)
])
