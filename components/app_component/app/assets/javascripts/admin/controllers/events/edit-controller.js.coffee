angular.module('admin.controllers')
.controller('EventsEditController', ['$http', '$location', '$routeParams', ($http, $location, $routeParams) ->
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
    permalink: '',
    info_blocks: [],
    location: { latitude: '', longitude: '', information: '' }
  };

  controller.city_names = []

  $http.get('/admins/regions').then((response) ->
    controller.city_names = _.map(response.data, ((obj) -> obj.name));
  );

  $http.get("/admins/events/#{$routeParams.id}").then((response) ->
    controller.event_info = {
      id:         response.data.id,
      title:      response.data.title,
      subtitle:   response.data.subtitle,
      city:       response.data.city,
      start_time: new Date(response.data.start_time),
      end_time:   new Date(response.data.end_time),
      contacts:   response.data.contacts,
      info:       response.data.info,
      course:     response.data.course,
      permalink:  response.data.permalink,
      location:   response.data.location,
      info_blocks: response.data.info_blocks
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
      subtitle: controller.event_info.subtitle,
      city: controller.event_info.city,
      start_time: controller.event_info.start_time,
      end_time: controller.event_info.end_time,
      contacts: controller.event_info.contacts,
      info: controller.event_info.info,
      course: controller.event_info.course,
      permalink: controller.event_info.permalink,
      location: controller.event_info.location,
      info_blocks: controller.event_info.info_blocks
    }

  @_deleteEventParams = (event_info) ->
    event_info: {
      id: event_info.id,
    };

  @addInfoBlock = () ->
    controller.event_info.info_blocks.push(@emptyInfoBlock())

  @emptyInfoBlock = () ->
    { name: '', content: '' }

  controller;
]);
