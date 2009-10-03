/*
 * SITEWIDE ONLOAD BEHAVIORS
 */

$(function(){

/* Add required resources */
	$.addResource('jquery.delay.js');
	$.addResource('jquery.blockUI.js');

/* Add javascript request type */
  $.ajaxSetup({
    'beforeSend': function(xhr) {xhr.setRequestHeader('Accept', 'text/javascript');}
  });

/* Handle ajax posts */
  $('.ajaxed').livequery(function(){
    if( $(this).size() ){
      if(!$.fn.ajaxSubmit){$.addResource('jquery.ajaxSubmit.js');}
      $(this).ajaxSubmit();
    }
  });

});
