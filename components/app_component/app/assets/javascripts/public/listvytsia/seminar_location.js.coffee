Listvytsia.seminarLocation =(lat, lng, info, zoom = 17) ->
  handler = Gmaps.build('Google')

  handler.buildMap
    provider:
      zoom: zoom
    internal:
      id: 'map'
  ,
  ->
    marker = handler.addMarker
      lat: lat,
      lng: lng,
      infowindow: info

    handler.map.centerOn(marker)
