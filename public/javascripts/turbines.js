$(function(){

  reloadChart = function(url) {
    $.get(url, false, function(){}, 'script');
  };
	clickListener = function(turbine_id) {
    reloadChart("/turbines/chart1/"+turbine_id)
	};

  var mapCenter = new google.maps.LatLng(40.8983, -103.9424);
  drawMapData("/data/turbines", mapCenter, 10);

  $('.week').livequery('click', function(){
    var data = $(this).metadata();
    reloadChart("/turbines/chart1/"+data.id+"?week="+data.week)
  });

  clickPoint = function(forecast_id) {
		reloadChart("/turbines/chart2/"+forecast_id)
	}

});

