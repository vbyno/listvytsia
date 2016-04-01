FileUploadController = ($scope, Upload, $timeout) ->
 $scope.uploadFiles = (files) ->
  $scope.files = files
  if files and files.length
    Upload.upload(
      url: 'https://angular-file-upload-cors-srv.appspot.com/upload'
      data: files: files).then ((response) ->
      $timeout ->
        $scope.result = response.data
    ), ((response) ->
      if response.status > 0
        $scope.errorMsg = response.status + ': ' + response.data
    ), (evt) ->
      $scope.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total))

FileUploadController.$inject = ['$scope', 'Upload', '$timeout']

do () ->
  angular.module('pictures').component('fileUploadComponent',
    templateUrl: 'pictures/file-upload.template.html',
    controller: FileUploadController,
    bindings:
      picture: '<'
  )