/*
 * DELAY ACTION - Delay : http://james.padolsey.com/javascript/jquery-delay-plugin/
 */

/* $.logger('jquery.delay.js : REQUESTED'); */

(function($){

	$.fn.delay = function(time, callback){ // $.logger('$.fn.delay() : INITIALIZED');

		$.fx.step.delay = function(){};

		return this.animate({delay:1}, time, callback);
	};

})(jQuery);

/* $.logger('jquery.delay.js : LOADED'); */