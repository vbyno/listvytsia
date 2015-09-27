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
  .when('/roles/new', {
    templateUrl: 'admin/views/roles/new.html',
    controller: 'RolesNewController',
    controllerAs: 'ctrl'
  })
  .when('/roles/:id/edit', {
    templateUrl: 'admin/views/roles/edit.html',
    controller: 'RolesEditController',
    controllerAs: 'ctrl'
  })
  .when('/users', {
    templateUrl: 'admin/views/users/index.html',
    controller: 'UsersIndexController',
    controllerAs: 'indexCtrl'
  })
  .when('/users/:id/edit', {
    templateUrl: 'admin/views/users/edit.html',
    controller: 'UsersEditController',
    controllerAs: 'ctrl'
  })
  .otherwise({
    redirectTo: '/'
  });
)