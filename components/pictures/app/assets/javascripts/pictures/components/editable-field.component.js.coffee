EditableFieldController = ($scope, $element, $attrs) ->
  ctrl = this
  ctrl.editMode = false

  ctrl.handleModeChange = ->
    if ctrl.editMode
      ctrl.onUpdate value: ctrl.fieldValue
      ctrl.fieldValueCopy = ctrl.fieldValue
    ctrl.editMode = !ctrl.editMode

  ctrl.reset = ->
    ctrl.fieldValue = ctrl.fieldValueCopy

  ctrl.$onInit = ->
    ctrl.fieldValueCopy = ctrl.fieldValue
    if !ctrl.fieldType
      ctrl.fieldType = 'text'

  ctrl

EditableFieldController.$inject = ['$scope', '$element', '$attrs']

angular.module('pictures').component 'editableFieldComponent',
  templateUrl: 'pictures/editable-field.template.html'
  controller: EditableFieldController
  bindings:
    fieldValue: '@'
    fieldType: '@?'
    onUpdate: '&'

