$(function(){
  
	clickListener = function(marker) {
    $.get("/turbines/chart/"+marker.title, false, function(){}, 'script');
	};

  var mapCenter = new google.maps.LatLng(40.578065, -105.071905);
  drawMapData("/data/turbines", mapCenter, 8);

});

