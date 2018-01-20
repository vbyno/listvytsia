angular.module('admin.controllers')
.controller('EventsEditController', ['$http', '$location', '$routeParams', ($http, $location, $routeParams) ->
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

  $http.get("/admins/events/#{$routeParams.id}").then((response) ->
    controller.event_info = {
      id:         response.data.id,
      title:      response.data.title,
      city:       response.data.city,
      start_time: new Date(response.data.start_time),
      end_time:   new Date(response.data.end_time),
      contacts:   response.data.contacts,
      course:     response.data.course
    };
  );

  @updateEvent = () ->
    $http.put("/admins/events/#{controller.event_info.id}", @_eventParams()).then( ->
      $location.path('/events');
    );

  @locationPath = () ->
    "##{$location.path()}";

  @readonlyIdentifier = () ->
    true

  @_eventParams = () ->
    event: {
      title: controller.event_info.title,
      city: controller.event_info.city,
      start_time: controller.event_info.start_time,
      end_time: controller.event_info.end_time,
      contacts: controller.event_info.contacts,
      course: controller.event_info.course
    }

  @_deleteEventParams = (event_info) ->
    event_info: {
      id: event_info.id,
    };

  controller;
]);
