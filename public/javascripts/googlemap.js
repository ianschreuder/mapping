$(function(){
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
});
