jQuery(function($){
	$(document).ready(function(){
		$(".nav li").mouseover(function(){
			$(this).addClass("hover");
		});
		$(".nav li").mouseout(function(){
			$(this).removeClass("hover");
		});
		$(".header .nav .nav-content").mouseout(function(){
			$(this).parent().addClass("hover");
		});
		$('.header').stickUp();
		/* top */
		var offset = 300,
			offset_opacity = 1200,
			scroll_top_duration = 700,
			$back_to_top = $('#gotop');
		$(window).scroll(function(){
			if( $(this).scrollTop() > offset ) $("#topfixed").attr("style","bottom:50px");
			else $("#topfixed").removeAttr("style");
		});
		$back_to_top.on('click', function(event){
			event.preventDefault();
			$('body,html').animate({
				scrollTop: 0 ,
			 	}, scroll_top_duration
			);
		});
	});
});