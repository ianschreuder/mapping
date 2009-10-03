$(function(){
	$.addResource('jquery.blockUI.js');

	var mapElement = document.getElementById("map_content");
	var pageContainer = $("#main-container");

	drawGoogleMap = function(div, altitude, mapCenter, data_points) {
		var mapOptions = {
	    zoom: altitude,
	    center: mapCenter,
	    mapTypeId: google.maps.MapTypeId.ROADMAP
    };
	  var gMap = new google.maps.Map(div, mapOptions);
    $.each(data_points, function(i,item){
			var point = new google.maps.LatLng(item.lat, item.long);
      var marker = new google.maps.Marker({position: point, map: gMap, title: "ID: "+item.id});
			var content = "<div><h3>ID: " + item.id + "</h3></div";
			var infowindow = new google.maps.InfoWindow({content: content});
      google.maps.event.addListener(marker, 'mouseover', function() {
				infowindow.open(gMap, marker);
			});
			google.maps.event.addListener(marker, 'mouseout', function() {
				infowindow.close();
			});
      google.maps.event.addListener(marker, 'click', function(){
        clickListener(marker);
      });

    });

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
	
	clickListener = function(marker) {
	};

	unBlockMap = function(div) {
		div.unblock();
	};

	// Method to retrieve coordinates from the database based on boundaries.
	// When new coordinates are received, it fires the page redraw functions
	drawMapData = function(dataUrl, center, zoom) {
		blockMap(pageContainer);
		$.getJSON(  
			dataUrl,
			{zoom: zoom},
			function(data) {
				drawGoogleMap(mapElement, zoom, center, data);
				unBlockMap(pageContainer);
			}  
		);
	};

  
});
