Listvytsia.officeLocation = ->
  lat = 49.8278585
  lng = 24.0163906
  handler = Gmaps.build('Google')

  handler.buildMap
    provider:
      zoom: 17
    internal:
      id: 'office_map'
  ,
  ->
    marker = handler.addMarker
      lat: lat,
      lng: lng,
      infowindow: 'Офіс ЛМГО Ліствиця'

    handler.map.centerOn(marker)
