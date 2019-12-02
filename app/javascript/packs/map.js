import GMaps from 'gmaps/gmaps.js';

let restaurantName = document.querySelector('.restaurant-name').innerHTML;
let restaurantImage = document.querySelector('.image-cover').content

var infowindow = new google.maps.InfoWindow({
    content: ('<h4>' + restaurantName + '</h4>')
    // content: ("<div style='float:left'><img src='http://i.stack.imgur.com/g672i.png'></div><div style='float:right; padding: 10px;'><b>Title</b><br/>123 Address<br/> City,Country</div>")
});


const mapElement = document.getElementById('map');
function initMap() {
  const markers = JSON.parse(mapElement.dataset.markers);

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 15,
    center: markers,
    fullscreenControl: false,
    streetViewControl: false,
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

  var marker = new google.maps.Marker({
    position: markers,
    map: map,
    icon: 'https://res.cloudinary.com/bia-app/image/upload/v1575301929/marker_oxy5mm.svg'
  });

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

  document.getElementById("map").addEventListener('mouseover', function() {
    infowindow.open(map,marker);
  });

  document.querySelector("map").addEventListener('mouseout', function() {
    infowindow.close();
  });
}

if (mapElement) {
  initMap()
}
