$(function(){
	var mapElement = document.getElementById("map_content");
	var coordTable = $("#result_coords")

	$('#show_map').click(function(){
		updatePage(8, 40, 41, -105.8, -104.3);
	});

	updatePage = function(zoom, lat_min, lat_max, lng_min, lng_max) {
		var dataUrl = "/basic/coords";
		$.getJSON(  
			dataUrl,
			{zoom: zoom, lat_min: lat_min, lat_max: lat_max, lng_min: lng_min, lng_max: lng_max},
			function(data) {
				var center = new google.maps.LatLng(data.center.latitude, data.center.longitude);
				drawGoogleMap(mapElement, zoom, center, data.data_points);
				drawCoordinateTable(coordTable, data.data_points);
			}  
		);
	};

	drawGoogleMap = function(div, altitude, mapCenter, data_points) {
		var mapOptions = {
	    zoom: altitude,
	    center: mapCenter,
	    mapTypeId: google.maps.MapTypeId.TERRAIN
    };
	  var gMap = new google.maps.Map(div, mapOptions);
		$.each(data_points, function(i,item){
			var point = new google.maps.LatLng(item.latitude, item.longitude);
			var marker = new google.maps.Marker({position: point, map: gMap, title: "data point"});
		});
	  google.maps.event.addListener(gMap, 'dragend', function() {
			center = gMap.get_center();
			bounds = gMap.get_bounds();
			zoom = gMap.get_zoom();
			south_west = bounds.getSouthWest();
			north_east = bounds.getNorthEast();
			updatePage(zoom, south_west.lat(), north_east.lat(), south_west.lng(), north_east.lng());
	  });
	};

	drawCoordinateTable = function(div, data_points) {
		var coord_table = "<table><col style='width:100px'/><col /><tr><th>Latitude</th><th>Longitude</th>";
		$.each(data_points, function(i,data_point){
			coord_table = coord_table + "<tr><td>" + data_point.latitude + "</td><td>" + data_point.longitude + "</td></tr>";
		});
		coord_table = coord_table + "</table>";
		div.html(coord_table);
	}

});
