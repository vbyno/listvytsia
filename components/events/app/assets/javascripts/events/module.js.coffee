'use strict'

angular
.module('event',
  [
    'templates',
    'ngFileUpload',
    'uib/template/modal/window.html',
    'uib/template/modal/backdrop.html',
    'angular.filter',
    'smart-table'
  ]
)
.config(['$compileProvider', ($compileProvider) ->
  $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|javascript):/)
])
.filter('notEmpty', () ->
  (input, attribute, optional_attribute) ->
    input.filter( (event) -> event[attribute] != '');
);
