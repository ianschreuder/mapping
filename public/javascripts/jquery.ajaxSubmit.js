/*
	SUBMIT FORM VIA AJAX

	HTML Markup
	--------------------------------------------------------------------
	<form class="ajaxed" action="[url]>...</form>

	Implementation
	--------------------------------------------------------------------
	$('.ajaxed').ajaxSubmit();

 */

/* $.logger('jquery.ajaxSubmit.js : REQUESTED'); */

(function($){

	$.fn.ajaxSubmit = function(options){ // $.logger('$.fn.ajaxSubmit() : INITIALIZED');

		return this.each(function(){

			var 
				$this = $(this),
				callback = function(){},
				settings = $.extend( {}, $.fn.ajaxSubmit.defaults, options ),
				o = $.metadata ? $.extend( settings, $this.metadata() ) : settings;

			if(!settings.contentType && $this.is('form')){
				settings.contentType = $this.attr('enctype');
			}

			if(!settings.event){
				settings.event = ($this.is('form') ? 'submit' : 'click');
			}

			if(!settings.url){
				if($this.is('form')) {
					settings.url = this.action;
				} else if($this.is('a')) {
					settings.url = this.href;
				}
			}

			if(settings.showSpinner){
				callback = function(){
					settings.callback();
					$.unblockUI();
				};
			} else {
				callback = settings.callback;
			}

			$this.bind(settings.event, function(){

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

				var $method = (settings.method == 'post' ? $.post : $.get);

				$method(settings.url, settings.dataString ? settings.dataString : $(this).serialize(), callback, settings.type);

				return false;
			});

		});
	};

	$.fn.ajaxSubmit.defaults = {
		event : false,
		url : false,
		dataString : false,
		method : 'get',
		callback : function(){},
		type : 'script',
		message : 'Processing...',
		showSpinner : false
	};

})(jQuery);

/* $.logger('jquery.ajaxSubmit.js : LOADED'); */
