import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
const userShow = document.getElementById('popupDisabled');



const locate_user = () => {
  const set_location = (data) => {
      // {latitude: data.coords.latitude, longitude: data.coords.longitude}
  }
  navigator.geolocation.getCurrentPosition(set_location);
}

let user_location_borwser = locate_user

function initMap(mapElement) {
  const markers = JSON.parse(mapElement.dataset.markers);
  const firstMarker = markers[0]
  const userLocation = document.getElementById('user-det-location')
  let center = {lat: firstMarker.lat, lng: firstMarker.lng}
  if (userLocation && userLocation.dataset.lat !== "na") {
    const userLat = userLocation.dataset.lat
    const userLong = userLocation.dataset.long
    console.log("determined")
    console.log(userLat)
    console.log(userLong)
    center = {lat: parseFloat(userLat), lng: parseFloat(userLong)}
  }
  console.log({center})
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 13,
    center: center,
    fullscreenControl: false,
    streetViewControl: false,
    mapTypeControl: false,
    styles: [
    {
        "featureType": "all",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "saturation": 36
            },
            {
                "color": "#333333"
            },
            {
                "lightness": 40
            }
        ]
    },
    {
        "featureType": "all",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#ffffff"
            },
            {
                "lightness": 16
            }
        ]
    },
    {
        "featureType": "all",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#fefefe"
            },
            {
                "lightness": 20
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#fefefe"
            },
            {
                "lightness": 17
            },
            {
                "weight": 1.2
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#f5f5f5"
            },
            {
                "lightness": 20
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#f2f2f2"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#f5f5f5"
            },
            {
                "lightness": 21
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#dedede"
            },
            {
                "lightness": 21
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "lightness": 17
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "lightness": 29
            },
            {
                "weight": 0.2
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "lightness": 18
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "lightness": 16
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#f2f2f2"
            },
            {
                "lightness": 19
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#e9e9e9"
            },
            {
                "lightness": 17
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#757575"
            }
        ]
    }
  ]
  });


  var infowindow = new google.maps.InfoWindow();

  markers.forEach((marker)=> {
    // const latLng = google.maps.LatLng(marker.latitude,marker.longitude)
    var myLatLng = {lat: marker.lat, lng: marker.lng};
    const content = marker.infoWindow.content;
    var marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
      icon: 'https://res.cloudinary.com/bia-app/image/upload/v1575380004/map_marker_o2a2ut.svg',
    });


    // ---Marker for gps location---

    // var locationMarker = new google.maps.Marker({
    //   position: center,
    //   map: map,
    //   icon: 'choose icon.....'
    // })


    if (!userShow) {

      marker.addListener('click', function() {
        infowindow.setContent(content);
        infowindow.open(map, marker);
      });

      map.addListener('click', function() {
        infowindow.close();
      });
    }
  })


  map.setOptions({
    disableDefaultUI:true,
  });

  document.getElementById("map").addEventListener('mouseover', function() {
    map.setOptions({
      disableDefaultUI:false
    });
  });

  document.getElementById("map").addEventListener('mouseout', function() {
    map.setOptions({
      disableDefaultUI:true
    });
  });
}

if (mapElement) {
  initMap(mapElement)
  window.initGoogleMap = initMap
}

export {initMap}
