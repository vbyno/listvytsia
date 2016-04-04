FileUploadController = ($scope, Upload, $timeout) ->
  ctrl = this

  $scope.uploadFiles = (files) ->
    $scope.files = files
    angular.forEach files, (file) ->
      file.upload = Upload.upload
        url: ctrl.uploadUrl
        data:
          picture:
            data: file
            page_id: ctrl.pageId
      file.upload.then ((response) ->
        $timeout ->
          file.result = response.data
      ), ((response) ->
        if response.status > 0
          $scope.errorMsg = response.status + ': ' + response.data
      ), (evt) ->
        file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total))
  ctrl

FileUploadController.$inject = ['$scope', 'Upload', '$timeout']

do () ->
  angular.module('pictures').component('fileUploadComponent',
    templateUrl: 'pictures/file-upload.template.html',
    controller: FileUploadController,
    bindings:
      uploadUrl: '@'
      pageId: '@'
  )
