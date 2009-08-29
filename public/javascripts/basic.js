$(function(){
	var dataToBeSent = $("form").serialize();
	$('#coord_search_button').click(function(){
		$.getJSON(  
			"/basic/coords",  
			dataToBeSent,  
			function(data) {
				var result = "<table><col width='100'/><col /><tr><th>Latitude</th><th>Longitude</th>";
				$.each(data, function(i,item){
					result = result + "<tr><td>" + item.latitude + "</td><td>" + item.longitude + "</td></tr>";
				});
				result = result + "</table>";
				$("#result").html(result);
			}  
		);
	});
	
	

/*
  $('#display_span').click(function(){
    var latlng = new google.maps.LatLng(40.0000, -105.0000);
    var myOptions = {
      zoom: 12,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.TERRAIN
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    $.getJSON('/basic/coords',function(data){
      $.each(data, function(i,item){
        latlng = new google.maps.LatLng(item.latitude, item.longitude);
        marker = new google.maps.Marker({
          position: latlng, 
          map: map, 
          title:"Hello World!"
        });
      });
    }); 
  });
*/


});

