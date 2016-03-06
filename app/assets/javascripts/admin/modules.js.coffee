'use strict';

angular.module('admin.config', ['ngRoute', 'templates']);
angular.module('admin.controllers', ['ngRoute']);
angular.module('admin.directives', []);

angular.module('admin', ['admin.config', 'admin.controllers', 'admin.directives']);

# This will cause app to compile when Turbolinks loads a new page
# and removes the need for ng-app in the DOM
$(document).on('ready page:load', ->
  angular.bootstrap(document, ['admin'], { strictDi: true })
);
