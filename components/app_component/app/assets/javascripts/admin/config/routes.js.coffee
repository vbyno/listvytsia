angular.module('admin.config')
.config(['$routeProvider', ($routeProvider) ->
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
  .when('/static_pages', {
    templateUrl: 'admin/views/static_pages/index.html',
    controller: 'StaticPagesIndexController',
    controllerAs: 'indexCtrl'
  })
  .when('/static_pages/new', {
    templateUrl: 'admin/views/static_pages/new.html',
    controller: 'StaticPagesNewController',
    controllerAs: 'ctrl'
  })
  .when('/static_pages/:id/edit', {
    templateUrl: 'admin/views/static_pages/edit.html',
    controller: 'StaticPagesEditController',
    controllerAs: 'ctrl'
  })
  .when('/chunks', {
    templateUrl: 'admin/views/chunks/index.html',
    controller: 'ChunksIndexController',
    controllerAs: 'indexCtrl'
  })
  .when('/chunks/new', {
    templateUrl: 'admin/views/chunks/new.html',
    controller: 'ChunksNewController',
    controllerAs: 'ctrl'
  })
  .when('/chunks/:id/edit', {
    templateUrl: 'admin/views/chunks/edit.html',
    controller: 'ChunksEditController',
    controllerAs: 'ctrl'
  })
  .otherwise({
    redirectTo: '/'
  });
]);
