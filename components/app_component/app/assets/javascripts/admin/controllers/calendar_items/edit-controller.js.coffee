angular.module('admin.controllers')
.controller('CalendarItemsEditController', ['$http', '$location', '$routeParams', ($http, $location, $routeParams) ->
  controller = this;
  controller.calendar_item = {
    city: '',
    start_date: '',
    end_date: '',
    contacts: '',
    course: ''
  };

  $http.get("/admins/calendar_items/#{$routeParams.id}").then((response) ->
    controller.calendar_item = response.data;
  );

  @updateCalendarItem = () ->
    $http.put("/admins/calendar_items/#{controller.calendar_item.id}", @_calendarItemParams()).then( ->
      $location.path('/calendar_items');
    );

  @locationPath = () ->
    "##{$location.path()}";

  @readonlyIdentifier = () ->
    true

  @_calendarItemParams = () ->
    calendar_item: {
      city: controller.calendar_item.city,
      start_date: controller.calendar_item.start_date,
      end_date: controller.calendar_item.end_date,
      contacts: controller.calendar_item.contacts,
      course: controller.calendar_item.course
    }

  @_deleteCalendarItemParams = (calendar_item) ->
    calendar_item: {
      id: calendar_item.id,
    };

  controller;
]);
