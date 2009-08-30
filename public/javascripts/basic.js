$(function(){
	$.addResource('jquery.blockUI.js');
	
	var mapElement = document.getElementById("map_content");
	var pageContainer = $("#main-container");
	var coordTable = $("#result_coords")

	$('#show_map').click(function(){
		updatePageCoordinates(8, 40, 41, -105.8, -104.3); // hard coded start values
	});

	// Method to retrieve coordinates from the database based on boundaries.
	// When new coordinates are received, it fires the page redraw functions
	updatePageCoordinates = function(zoom, lat_min, lat_max, lng_min, lng_max) {
		var dataUrl = "/basic/coords";
		blockMap(pageContainer);
		$.getJSON(  
			dataUrl,
			{zoom: zoom, lat_min: lat_min, lat_max: lat_max, lng_min: lng_min, lng_max: lng_max},
			function(data) {
				var center = new google.maps.LatLng(data.center.latitude, data.center.longitude);
				drawGoogleMap(mapElement, zoom, center, data.data_points);
				drawCoordinateTable(coordTable, data.data_points);
				unBlockMap(pageContainer);
			}  
		);
	};

	drawGoogleMap = function(div, altitude, mapCenter, data_points) {
		var mapOptions = {
	    zoom: altitude,
	    center: mapCenter,
	    mapTypeId: google.maps.MapTypeId.ROADMAP
    };
	  var gMap = new google.maps.Map(div, mapOptions);
		$.each(data_points, function(i,item){
			var point = new google.maps.LatLng(item.latitude, item.longitude);
			var size = (item.num_points == 1) ? "_small" : "";
			var image = '/images/' + item.status + size + '.gif';
			var marker = new google.maps.Marker({position: point, map: gMap, title: "ID: "+item.id, icon: image});
			var content = "<div><h1>DOOFUS</h1><br/><h3>ID: " + item.id + "</h3></div";
			var infowindow = new google.maps.InfoWindow({content: content});
			google.maps.event.addListener(marker, 'mouseover', function() {
				infowindow.open(gMap, marker);
			});
			google.maps.event.addListener(marker, 'mouseout', function() {
				infowindow.close();
			});
		});
	  google.maps.event.addListener(gMap, 'dragend', function() {
			listenerRedraw(gMap);
	  });
		google.maps.event.addListener(gMap, 'zoom_changed', function() {
			listenerRedraw(gMap);
	  });
	};

	drawCoordinateTable = function(div, data_points) {
		var coord_table = "<table><col style='width:100px'/><col /><tr><th>Latitude</th><th>Longitude</th>";
		$.each(data_points, function(i,data_point){
			coord_table = coord_table + "<tr><td>" + data_point.latitude + "</td><td>" + data_point.longitude + "</td></tr>";
		});
		coord_table = coord_table + "</table>";
		div.html(coord_table);
	};

	// bounded listener action that grabs the map boundaries and tells the page to get new coordinates based on boundaries
	listenerRedraw = function(gMap) {
		center = gMap.get_center();
		bounds = gMap.get_bounds();
		zoom = gMap.get_zoom();
		south_west = bounds.getSouthWest();
		north_east = bounds.getNorthEast();
		updatePageCoordinates(zoom, south_west.lat(), north_east.lat(), south_west.lng(), north_east.lng());
	};

	blockMap = function(obj) {
		obj.block({
			message:'<p><img src="/images/page_spinner.gif"/></p>',
			css:{
				borderWidth : '0',
				background : 'transparent',
				color : '#FFF'
			}
		});
	};

	unBlockMap = function(div) {
		div.unblock();
	};

});
