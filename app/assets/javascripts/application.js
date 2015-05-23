// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require gmaps/google
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

ready = function() {
  var lat = 49.798381,
      lng = 24.035034;
  handler = Gmaps.build('Google');
  handler.buildMap({
    provider: {
      center: new google.maps.LatLng(lat, lng),
      zoom: 15
    },
    internal: {
      id: 'map'
    }
  },
  function() {
    markers = handler.addMarkers([
      {
        lat: lat,
        lng: lng,
        infowindow: "3 поверх"
      }
    ]);
    handler.fitMapToBounds();
  });
};

$(document).ready(ready)
$(document).on('page:load', ready)
