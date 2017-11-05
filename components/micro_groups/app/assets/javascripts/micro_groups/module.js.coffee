'use strict'

angular.module('micro_groups', [
  'templates',
  'ngFileUpload',
  'uib/template/modal/window.html',
  'uib/template/modal/backdrop.html'
])
angular.module('micro_groups').config(['$compileProvider', ($compileProvider) ->
  $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|javascript):/)
])
