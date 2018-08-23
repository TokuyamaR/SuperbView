ready = ->

  if !window.google

  # if !window.google.maps (if useing other google api)

    script = document.createElement('script')
    script.type = 'text/javascript';
    script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&' +
                  'language=ja&callback=triggerMap'
    document.body.appendChild(script)

  else
    triggerMap()

window.triggerMap = ->


  # --- new/edit --- #
  if $('.map-search-button').length

    MapHelper.searchShowMap($('.map-canvas').get(0),
      {
        mapHeight:      300,
        trigger:        $('.map-search-button'),
        addressInput:   $('.address'), #could be multiple
        latInput:       $('.latitude'),
        lngInput:       $('.longitude'),
        zoom:           10
        #scaleControl: ,
        #scrollwheel: ,
        #showMarker: ,
        #draggable: ,
        afterShow: ->
          console.log "Map is displayed."
      }
    )

  # --- index --- #
  if $('.map-index').length
    $.ajax(
      type: 'GET',
      url: '/spots.json',
      # data: { if you need }
    ).done( (data) ->
      if data.length
        MapHelper.showMapWithMarkers($('.map-index').get(0),
          {
            mapHeight:    400,
            mapLat:       data[0].latitude,  #center
            mapLng:       data[0].longitude, #center
            zoom:         2,
            showMarker:   false,
            draggable:    true,
            controller:   'spots',
            titleField:   'spot_name'
          }, data)
    )

# For turbolinks
$(document).ready(ready)
$(document).on 'page:load', ready
