angular.module('admin.config')
.config(($routeProvider) ->
  $routeProvider
  .when('/', {
    templateUrl: 'admin/views/index.html'
  })
  .when('/roles', {
    templateUrl: 'admin/views/roles/index.html',
    controller: 'RolesIndexController',
    controllerAs: 'indexCtrl'
  })
  .when('/users', {
    templateUrl: 'admin/views/users/index.html'
  })
  .otherwise({
    redirectTo: '/'
  });
)