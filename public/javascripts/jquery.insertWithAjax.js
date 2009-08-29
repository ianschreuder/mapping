/*
	INSERT CONTENT WITH AJAX

	HTML Markup
	--------------------------------------------------------------------
	<div id="myTarget"></div>

	<a href="/path/to/content" class="insert {target:'#mytarget'}">Insert url into #myTarget</a>

	Implementation
	--------------------------------------------------------------------
	$('.insert').insertWithAjax();

 */

/* $.logger('jquery.insertWithAjax.js : REQUESTED'); */

(function($){
	
	/* Add required scripts */
	if(!$.blockUI){$.addResource('jquery.blockUI.js');}

	$.fn.insertWithAjax = function(options){ // $.logger('$.fn.insertWithAjax() : INITIALIZED');

		this.click(function(){

			var
				$this = $(this),
				settings = $.extend({}, $.fn.insertWithAjax.defaults, options),
				o = $.metadata ? $.extend(settings, $this.metadata()) : settings;

			if(settings.showSpinner){
				$.blockUI({
					message:'<p><img src="/images/page_spinner.gif"/><br/><strong>'+settings.message+'</strong></p>',
					css:{
						borderWidth : '0',
						background : 'transparent',
						color : '#FFF'
					} 
				});
			}

			$(settings.target)
				.css('display','none')
				.load(this.href,function(){
					$(this).fadeIn('fast');
					if(settings.showSpinner){$.unblockUI();}
					settings.callback();
					$("input[type='text']:first:visible:enabled", this).focus();
				});
				

			if($('#module_messages').css('display') != 'none'){
				$('#module_messages').fadeOut('fast',function(){
					$(this).css('display','none');
					$(this).empty();
				});
			}

			return false;
		});

		return this;
	};

	$.fn.insertWithAjax.defaults = {
		callback : function(){},
		target : false,
		message : 'Loading...',
		showSpinner : false
	};

})(jQuery);

/* $.logger('jquery.insertWithAjax.js : LOADED'); */