angular.module('admin.controllers')
.controller('EventsNewController', ['$http', '$location', ($http, $location) ->
  controller = this;
  controller.event_info = {
    title: '',
    subtitle: '',
    city: '',
    start_time: '',
    end_time: '',
    contacts: '',
    info: '',
    course: '',
    permalink: ''
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
      subtitle: controller.event_info.subtitle,
      city: controller.event_info.city,
      start_time: controller.event_info.start_time,
      end_time: controller.event_info.end_time,
      contacts: controller.event_info.contacts,
      info: controller.event_info.info,
      course: controller.event_info.course,
      permalink: controller.event_info.permalink
    }

  @locationPath = () ->
    "##{$location.path()}"

  controller;
]);
