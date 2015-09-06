app = angular.module('role', ['ngResource', 'templates']);

app.directive('rolesList', ->
  restrict: 'E',
  templateUrl: 'admin/templates/roles-list.html'
  controller: (($scope, $resource) ->
    Role = $resource('/admin/roles/:id.json', {id: '@id'}, {update: {method: 'PUT'}});
    $scope.roles = Role.query();
    $scope.addRole = ->
      role = Role.save($scope.newRole)
      $scope.roles.push(role);
      $scope.newRole = {};
    $scope.deleteRole = (role) ->
      $scope.roles.splice($scope.roles.indexOf(role), 1);
  ),
  controllerAs: 'roleCtrl'
);
