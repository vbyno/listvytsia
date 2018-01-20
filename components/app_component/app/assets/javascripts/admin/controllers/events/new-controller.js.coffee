angular.module('admin.controllers')
.controller('EventsNewController', ['$http', '$location', ($http, $location) ->
  controller = this;
  controller.event_info = {
    title: '',
    city: '',
    start_time: '',
    end_time: '',
    contacts: '',
    course: ''
  };

  controller.city_names = []

  $http.get('/admins/regions').then((response) ->
    controller.city_names = _.map(response.data, ((obj) -> obj.name));
  );

  @createEvent = () ->
    $http.post('/admins/events', @_eventParams()).then( ->
      $location.path('/events');
    );

  @_eventParams = () ->
    'event': {
      title: controller.event_info.title,
      city: controller.event_info.city,
      start_time: controller.event_info.start_time,
      end_time: controller.event_info.end_time,
      contacts: controller.event_info.contacts,
      course: controller.event_info.course
    }

  @locationPath = () ->
    "##{$location.path()}"

  controller;
]);
