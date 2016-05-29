Listvytsia.seminarLocation = ->
  lat = 49.8098497
  lng = 23.9721197
  handler = Gmaps.build('Google')

  handler.buildMap
    provider:
      zoom: 17
    internal:
      id: 'map'
  ,
  ->
    marker = handler.addMarker
      lat: lat,
      lng: lng,
      infowindow: 'Місце проведення семінару'

    handler.map.centerOn(marker)
