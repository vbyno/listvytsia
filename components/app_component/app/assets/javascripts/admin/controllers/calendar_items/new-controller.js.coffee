angular.module('admin.controllers')
.controller('CalendarItemsNewController', ['$http', '$location', ($http, $location) ->
  controller = this;
  controller.calendar_item = {
    city: '',
    start_date: '',
    end_date: '',
    contacts: '',
    course: ''
  };

  controller.city_names = []

  $http.get('/admins/items').then((response) ->
    controller.city_names = _.map(response.data, ((obj) -> obj.name));
  );

  @createCalendarItem = () ->
    $http.post('/admins/items', @_microGroupParams()).then( ->
      $location.path('/calendar_items');
    );

  @_microGroupParams = () ->
    item: {
      city: controller.calendar_item.city,
      start_date: controller.calendar_item.start_date,
      end_date: controller.calendar_item.end_date,
      contacts: controller.calendar_item.contacts,
      course: controller.calendar_item.course
    }

  @locationPath = () ->
    "##{$location.path()}"

  controller;
]);
