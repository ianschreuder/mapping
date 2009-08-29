/*
 * SITEWIDE ONLOAD BEHAVIORS
 */

$(function(){

/* Add required resources */
	$.addResource('jquery.delay.js');

/* Add javascript request type */
  $.ajaxSetup({
    'beforeSend': function(xhr) {xhr.setRequestHeader('Accept', 'text/javascript');}
  });

/* Add close button to success/error/notice messages */
	$('.message').livequery(function(){
		$('<img/>')
			.attr({
				src : '/images/clear.gif',
				title : 'close',
				alt : 'close'
			})
			.css('display','none')
			.appendTo(this)
			.delay(1000)
			.fadeIn('fast')
			.click(function(){
				$(this).fadeOut('fast',function(){
					$(this).parent().slideUp('fast',function(){
						$(this).remove();
					});
				});
			});
	});

	/* Add close button to auxiliary panels */
	$('.auxiliary').livequery(function(){
		$('<img/>')
			.attr({
				src : '/images/clear.gif',
				title : 'close',
				alt : 'close',
				id : 'close_panel'
			})
			.addClass('closeButton')
			.css('display','none')
			.appendTo(this)
			.fadeIn('slow')
			.click(function(){
				$(this).fadeOut('fast',function(){
					$(this).parent().slideUp('fast',function(){
						$(this).parent().css('display','none').empty();
					});
				});
				if($('.message').size()){
					$('#module_messages')
						.slideUp('fast',function(){
							$(this).empty();
						});
				}
			});
	});


/* Insert asynchronous content */
  $('.insert').livequery(function(){
    if( $(this).size() ){
      if(!$.fn.insertWithAjax){$.addResource('jquery.insertWithAjax.js');}
     	$(this).insertWithAjax({
      	target : '#record_manager'
     	});
    }
  });

/* Handle ajax posts */
  $('.ajaxed').livequery(function(){
    if( $(this).size() ){
      if(!$.fn.ajaxSubmit){$.addResource('jquery.ajaxSubmit.js');}
      $(this).ajaxSubmit();
    }
  });

});
