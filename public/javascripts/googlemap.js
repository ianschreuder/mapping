$(document).ready(function(){
  var map = new GMap2(document.getElementById('map'));
  var burnsvilleMN = new GLatLng(40.0000,--150.0000);
  map.setCenter(burnsvilleMN, 8);
});