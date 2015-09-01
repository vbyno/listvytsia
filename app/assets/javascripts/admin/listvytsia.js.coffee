'use strict';

app = angular.module("Listvytsia", ["ngResource"]);

# This will cause app to compile when Turbolinks loads a new page
# and removes the need for ng-app in the DOM
$(document).on('ready page:load', ->
  angular.bootstrap(document, ['Listvytsia'])
);

