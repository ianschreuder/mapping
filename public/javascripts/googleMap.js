[{"coord":{"created_at":"2009-08-20T01:56:11Z","id":3,"latitude":"40.0000","longitude":"-105.0000","updated_at":"2009-08-20T01:56:11Z","x_utm":"","y_utm":""}},{"coord":{"created_at":"2009-08-21T05:00:25Z","id":4,"latitude":null,"longitude":null,"updated_at":"2009-08-21T05:00:25Z","x_utm":null,"y_utm":null}}]

$(function(){

	$('#display_span').livequery(function(){
    var latlng = new google.maps.LatLng(40.578065, -105.071905);
    var myOptions = {
      zoom: 8,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.TERRAIN
    };
    var map = new google.maps.Map(document.getElementById("map"), myOptions);
    $.getJSON('/basic/coords',function(data){
      $.each(data, function(i,item){
alert(item.latitude);
        var latlng = new google.maps.LatLng(item.latitude, item.longitude);
        var marker = new google.maps.Marker({
          position: latlng,
          map: map,
          title:"New POINT"
        });
      });
    });
	});

});

