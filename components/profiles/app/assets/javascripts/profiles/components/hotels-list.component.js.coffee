ProfilesListController = ($http) ->
  ctrl = this
  ctrl.profiles = []

  ctrl.loadProfiles = ->
    $http.get('/profiles.json?published=1').then (response) ->
      ctrl.profiles = response.data

  ctrl.loadProfiles()
  ctrl

ProfilesListController.$inject = ['$http']

do () ->
  angular.module('profiles').component 'profilesListComponent',
    templateUrl: 'profiles/profiles-list.template.html',
    controller: ProfilesListController
    bindings:
      profiles: '&'
