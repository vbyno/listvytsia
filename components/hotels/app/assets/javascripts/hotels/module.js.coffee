'use strict'

angular.module('hotels', [
  'templates',
  'ngFileUpload',
  'uib/template/modal/window.html',
  'uib/template/modal/backdrop.html',
  'angular-confirm'
])
angular.module('hotels').config(['$compileProvider', ($compileProvider) ->
  $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|javascript):/)
])
