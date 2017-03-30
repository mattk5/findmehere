var pos = "";
var streetAddress = "";

function Location() {
  this.coord = function() {
    if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            console.log("getting the coords!")
        })};
    return pos;
  };
  this.street = function() {
        var lat = pos.lat;
        var lng = pos.lng;
        var url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=" + lat + "," + lng + "&key=AIzaSyCrGYiVUGU5xJEhczYc-rVybtobuXmMkv8";

        return $.getJSON(url,function (data, textStatus) {
          streetAddress = data.results[0].formatted_address;
        console.log("converting to address!")
      });
  }
}

var local = new Location();

$(local.coord);
setTimeout(local.street, 5000);