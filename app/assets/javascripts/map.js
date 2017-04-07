/**
 * Created by ram on 29/1/17.
 */
var map;
var markers = [];
jQuery(function () {

});

function initMap() {

    var lat = 0;
    var lng = 0;
    lat = $('#map').attr('data-lat');
    lng = $('#map').attr('data-lng');

    console.log(lat + " : " + lng);

    if(lat!=null && lng!=null){
        var haightAshbury = {lat: parseFloat(lat), lng: parseFloat(lng)};
    }
    else{
        var haightAshbury = {lat: 8.46449629224177, lng: 76.9660949707031};
    }

    map = new google.maps.Map(document.getElementById('map'), {
        zoom: 12,
        center: haightAshbury,
        mapTypeId: 'terrain'
    });

    // This event listener will call addMarker() when the map is clicked.
    map.addListener('click', function(event) {
        clearMarkers();
        addMarker(event.latLng);
        $('#residence_association_lat').val(event.latLng.lat());
        $('#residence_association_lng').val(event.latLng.lng());
    });

    // Adds a marker at the center of the map.
    addMarker(haightAshbury);
}

// Adds a marker to the map and push to the array.
function addMarker(location) {
    var marker = new google.maps.Marker({
        position: location,
        map: map
    });
    markers.push(marker);
}

// Sets the map on all markers in the array.
function setMapOnAll(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
    setMapOnAll(null);
}

// Shows any markers currently in the array.
function showMarkers() {
    setMapOnAll(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
    clearMarkers();
    markers = [];
}

function initHouseMap() {

    var lat = 0;
    var lng = 0;
    lat = $('#map').attr('data-lat');
    lng = $('#map').attr('data-lng');

    console.log(lat + " : " + lng);

    if(lat!=null && lng!=null){
        var haightAshbury = {lat: parseFloat(lat), lng: parseFloat(lng)};
    }
    else{
        var haightAshbury = {lat: 8.46449629224177, lng: 76.9660949707031};
    }

    map = new google.maps.Map(document.getElementById('map'), {
        zoom: 12,
        center: haightAshbury,
        mapTypeId: 'terrain'
    });

    // This event listener will call addMarker() when the map is clicked.
    map.addListener('click', function(event) {
        clearMarkers();
        addMarker(event.latLng);
        $('#house_lat').val(event.latLng.lat());
        $('#house_lng').val(event.latLng.lng());
    });

    // Adds a marker at the center of the map.
    addMarker(haightAshbury);
}


function initSearchMap() {

    var lat = 0;
    var lng = 0;
    lat = $('#map').attr('data-lat');
    lng = $('#map').attr('data-lng');

    if(lat!=null && lng!=null){
        var haightAshbury = {lat: parseFloat(lat), lng: parseFloat(lng)};
    }
    else{
        var haightAshbury = {lat: 8.46449629224177, lng: 76.9660949707031};
    }

    map = new google.maps.Map(document.getElementById('map'), {
        zoom: 12,
        center: haightAshbury,
        mapTypeId: 'terrain'
    });

    // This event listener will call addMarker() when the map is clicked.
    map.addListener('click', function(event) {
        clearMarkers();
        addMarker(event.latLng);
        $('#q_house_lat_gt').val(event.latLng.lat()-0.1);
        $('#q_house_lat_lt').val(event.latLng.lat()+0.1);
        $('#q_house_lng_gt').val(event.latLng.lng()-0.1);
        $('#q_house_lng_lt').val(event.latLng.lng()+0.1);
    });

    // Adds a marker at the center of the map.
    addMarker(haightAshbury);
}