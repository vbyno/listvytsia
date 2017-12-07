ProfileInfoController = ($http) ->
  ctrl = this

  ctrl.turnEditModeOn = () ->
    ctrl.editMode = true

  ctrl.turnEditModeOff = () ->
    ctrl.editMode = false

  ctrl.updateProfile = () ->
    $http.put("/profiles/#{ctrl.profile.id}.json", @_profileParams()).then( ->
      ctrl.turnEditModeOff()
    );

  ctrl.createProfile = () ->
    $http.post("/profiles", @_profileParams()).then((response) ->
      ctrl.profile.id = response.data.id
      ctrl.turnEditModeOff()
    );

  ctrl.deleteProfile = () ->
    $http.delete("/profiles/#{ctrl.profile.id}.json").then (response) ->
      ctrl.profile.deleted = true

  @_profileParams = () ->
    profile:
      title: ctrl.profile.title
      link: ctrl.profile.link
      address: ctrl.profile.address
      phone: ctrl.profile.phone
      price: ctrl.profile.price
      published: ctrl.profile.published

  ctrl

ProfileInfoController.$inject = ['$http']

do () ->
  angular.module('profiles').component 'profileInfoComponent',
    templateUrl: 'profiles/profile-info.template.html',
    controller: ProfileInfoController,
    bindings:
      profile: '='
      editable: '<'
