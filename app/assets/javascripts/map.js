
//this allows to make a selection on the map//

function initialize() {
    var mapOptions = {
        center: new google.maps.LatLng(53.3428, -6.2661),
        zoom: 9,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById('map-position'),
        mapOptions);

    var bounds = new google.maps.LatLngBounds(
        new google.maps.LatLng(53.3428, -6.2661),
        new google.maps.LatLng(53.3428, -6.2661)
    );

    var rectangle = new google.maps.Rectangle({
        bounds: bounds,
        editable: true
    });

    rectangle.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);