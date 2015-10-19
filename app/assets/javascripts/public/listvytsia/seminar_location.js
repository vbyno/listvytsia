Listvytsia.seminarLocation = function() {
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
