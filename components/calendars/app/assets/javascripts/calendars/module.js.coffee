'use strict'

angular.module('calendars', [
  'templates',
  'ngFileUpload',
  'uib/template/modal/window.html',
  'uib/template/modal/backdrop.html',
  'angular.filter'
])
angular.module('calendars').config(['$compileProvider', ($compileProvider) ->
  $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|javascript):/)
])
