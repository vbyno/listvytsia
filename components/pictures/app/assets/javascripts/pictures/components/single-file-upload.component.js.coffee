SingleFileUploadController = ($scope, Upload) ->
  ctrl = this

  $scope.uploadFiles = (file, errFiles) ->
    $scope.f = file
    $scope.errFile = errFiles && errFiles[0]
    if (file)
      file.upload = Upload.upload({
        url: ctrl.uploadUrl,
        data: { picture: { data: file, page_id: ctrl.pageId } }
      });

      file.upload.then((response) ->
        $timeout( ->
          file.result = response.data;
        );
      , (response) ->
        if (response.status > 0)
          $scope.errorMsg = response.status + ': ' + response.data;
      , (evt) ->
        file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total))
      )

  ctrl

SingleFileUploadController.$inject = ['$scope', 'Upload']

do () ->
  angular.module('pictures').component('singleFileUploadComponent',
    templateUrl: 'pictures/single-file-upload.template.html',
    controller: SingleFileUploadController,
    bindings:
      uploadUrl: '@'
      pageId: '@'
      onAdd: '&'
  )
