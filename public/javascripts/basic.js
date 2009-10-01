$(function(){
	$.addResource('jquery.blockUI.js');
	
	var mapElement = document.getElementById("map_content");
	var pageContainer = $("#main-container");
	var coordTable = $("#result_coords")
  var mapCenter = new google.maps.LatLng(40.578065, -105.071905);

	// Method to retrieve coordinates from the database based on boundaries.
	// When new coordinates are received, it fires the page redraw functions
	updatePageCoordinates = function(zoom) {
		var dataUrl = "/data/meters";
		blockMap(pageContainer);
		$.getJSON(  
			dataUrl,
			{zoom: zoom},
			function(data) {
				drawGoogleMap(mapElement, zoom, mapCenter, data);
				drawCoordinateTable(coordTable, data);
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
			var point = new google.maps.LatLng(item.lat, item.long);
			var size = (item.num_points == 1) ? "_small" : "";
			var image = '/images/' + item.status + size + '.gif';
			//var marker = new google.maps.Marker({position: point, map: gMap, title: "ID: "+item.id, icon: image});
      var marker = new google.maps.Marker({position: point, map: gMap, title: "ID: "+item.id});
			var content = "<div><h1>DOOFUS</h1><br/><h3>ID: " + item.id + "</h3></div";
			var infowindow = new google.maps.InfoWindow({content: content});
			google.maps.event.addListener(marker, 'mouseover', function() {
				infowindow.open(gMap, marker);
			});
			google.maps.event.addListener(marker, 'mouseout', function() {
				infowindow.close();
			});
    });
	  //google.maps.event.addListener(gMap, 'dragend', function() {
			//listenerRedraw(gMap);
	  //});
    //google.maps.event.addListener(gMap, 'zoom_changed', function() {
			//listenerRedraw(gMap);
	  //});
	};

	drawCoordinateTable = function(div, data_points) {
		var coord_table = "<table><col style='width:100px'/><col /><tr><th>Latitude</th><th>Longitude</th>";
		$.each(data_points, function(i,data_point){
			coord_table = coord_table + "<tr><td>" + data_point.lat + "</td><td>" + data_point.long + "</td></tr>";
		});
		coord_table = coord_table + "</table>";
		div.html(coord_table);
	};

	//// bounded listener action that grabs the map boundaries and tells the page to get new coordinates based on boundaries
	//listenerRedraw = function(gMap) {
	//	center = gMap.get_center();
	//	bounds = gMap.get_bounds();
	//	zoom = gMap.get_zoom();
	//	south_west = bounds.getSouthWest();
	//	north_east = bounds.getNorthEast();
	//	updatePageCoordinates(zoom, south_west.lat(), north_east.lat(), south_west.lng(), north_east.lng());
	//};

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

  $(function(){
    //updatePageCoordinates(13); // hard coded start values
  });
  
});
