angular.module('admin.config')
.config(['$locationProvider', ($locationProvider) ->
  $locationProvider.hashPrefix('')
]);

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
  .when('/micro_groups', {
    templateUrl: 'admin/views/micro_groups/index.html',
    controller: 'MicroGroupsIndexController',
    controllerAs: 'indexCtrl'
  })
  .when('/micro_groups/new', {
    templateUrl: 'admin/views/micro_groups/new.html',
    controller: 'MicroGroupsNewController',
    controllerAs: 'ctrl'
  })
  .when('/micro_groups/:id/edit', {
    templateUrl: 'admin/views/micro_groups/edit.html',
    controller: 'MicroGroupsEditController',
    controllerAs: 'ctrl'
  })
  .when('/regions', {
    templateUrl: 'admin/views/regions/index.html',
    controller: 'RegionsIndexController',
    controllerAs: 'indexCtrl'
  })
  .when('/regions/new', {
    templateUrl: 'admin/views/regions/new.html',
    controller: 'RegionsNewController',
    controllerAs: 'ctrl'
  })
  .when('/regions/:id/edit', {
    templateUrl: 'admin/views/regions/edit.html',
    controller: 'RegionsEditController',
    controllerAs: 'ctrl'
  })
  .when('/calendar_items', {
    templateUrl: 'admin/views/calendar_items/index.html',
    controller: 'CalendarItemsIndexController',
    controllerAs: 'indexCtrl'
  })
  .when('/calendar_items/new', {
    templateUrl: 'admin/views/calendar_items/new.html',
    controller: 'CalendarItemsNewController',
    controllerAs: 'ctrl'
  })
  .when('/calendar_items/:id/edit', {
    templateUrl: 'admin/views/calendar_items/edit.html',
    controller: 'CalendarItemsEditController',
    controllerAs: 'ctrl'
  })
  .when('/events', {
    templateUrl: 'admin/views/events/index.html',
    controller: 'EventsIndexController',
    controllerAs: 'ctrl'
  })
  .when('/events/new', {
    templateUrl: 'admin/views/events/new.html',
    controller: 'EventsNewController',
    controllerAs: 'ctrl'
  })
  .when('/events/:id/edit', {
    templateUrl: 'admin/views/events/edit.html',
    controller: 'EventsEditController',
    controllerAs: 'ctrl'
  })
  .otherwise({
    redirectTo: '/'
  });
]);
