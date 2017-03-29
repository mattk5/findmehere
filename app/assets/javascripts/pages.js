// var poptartBox = function(time) {
//   var _time = time;

//   return {
//     getTime: function() {
//       if (navigator.geolocation) {
//           navigator.geolocation.getCurrentPosition(function(position) {
//             var pos = {
//               lat: position.coords.latitude,
//               lng: position.coords.longitude
//             };
//         })};
//       return _time;
//     }
//   }
// }
var pos = "";
function Hello() {

  this.greet = function() {
    if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
        })};
          return pos;
  };

  this.world = function() {
        var geocode = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=';
        var key = '&key=AIzaSyCrGYiVUGU5xJEhczYc-rVybtobuXmMkv8';
        var lat = pos.lat;
        var lng = pos.lng;
        $.ajax({
          url: geocode+lat+lng+key,
          success: function(response) {
            address = response;
          }
        })
  }
}

var UserLocation = function(address, coord, infoWindow) {
  this.address = address;
  this.coord = coord;
  this.infoWindow = infoWindow;

       
      UserLocation.prototype.getLocation = function() {
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          handleLocationError(false, infoWindow, map.getCenter());
        }
      }
      

      UserLocation.prototype.handleLocationError = function(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
      }

      UserLocation.prototype.convertToAddress = function(pos) {
        var geocode = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=';
        var key = '&key=AIzaSyCrGYiVUGU5xJEhczYc-rVybtobuXmMkv8';
        var lat = coord.lat;
        var lng = coord.lng;
        $.ajax({
          url: geocode+lat+lng+key,
          success: function(response) {
            address = response;
          }
        })
      }
    
}  
   