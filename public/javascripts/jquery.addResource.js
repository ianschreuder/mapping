/*
	ADD RESOURCE

	Implementation
	--------------------------------------------------------------------
	$.addResource('jquery.someLibrary.js');

 */

/* $.logger('jquery.addResource.js : REQUESTED'); */

(function($){
	
	$.addResource = function(resource){ // $.logger('$.addResource() : INITIALIZED');
	
		if(resource.indexOf('.js') != -1){
		
			$('<script/>')
				.attr({
					src : '/javascripts/'+resource,
					type : 'text/javascript'
				})
				.appendTo('head');
				
		} else {
		
			$('<link/>')
				.attr({
					href : '/stylesheets/'+resource,
					type : 'text/css',
					rel : 'stylesheet',
					media : 'screen'
				})
				.appendTo('head');
		}
	};

})(jQuery);

/* $.logger('jquery.addResource.js : LOADED'); */