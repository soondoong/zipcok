
var element_motion_visible = function() {
		var $motion = $('._motion');
		var windowT;

		if($motion.length){
			$motion.each(function(){
				var $this = $(this);
				var thisF = false;
				var thisT = $(this).offset().top;
				var thisH = $(this).height() / 2;
				var thisP = thisT + thisH;

				$(window).on('load scroll', function(){
					if(!thisF){
						windowT = $(window).scrollTop() + $(window).height();
						if(windowT > thisP){
							$this.addClass('_visible');
							thisF = true;
						}
					}
				});
			});
		}
}

element_motion_visible();