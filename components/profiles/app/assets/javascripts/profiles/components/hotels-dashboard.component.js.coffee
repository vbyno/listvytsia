ProfilesDashboardController = ($http) ->
  ctrl = this
  ctrl.profiles = []

  ctrl.addProfile = () ->
    ctrl.profiles.push({editable: true})

  ctrl.loadProfiles = ->
    $http.get('/profiles.json').then (response) ->
      ctrl.profiles = response.data

  ctrl.loadProfiles()
  ctrl

ProfilesDashboardController.$inject = ['$http']

do () ->
  angular.module('profiles').component 'profilesDashboardComponent',
    templateUrl: 'profiles/profiles-dashboard.template.html',
    controller: ProfilesDashboardController
    bindings:
      profiles: '&'
      deleteProfile: '&'
      editable: '<'
