// Google Maps Autocomplete
function initialize() {
  var input = document.getElementById('locationSearchField');
  if (input) {
    new google.maps.places.Autocomplete(input);
  }
}

google.maps.event.addDomListener(window, 'load', initialize);
