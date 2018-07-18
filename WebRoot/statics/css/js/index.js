/*banner*/
$('.slick').slick({
	autoplay:true,
	arrows:false,
	dots: true
});
$('.index-service .container ul').slick({
	autoplay:true,
	arrows:false,
	dots: false,
	slidesToShow:4,
	slidesToScroll:2
});
/* 首页公告 */
var scrtime;
$(".ggao-container").hover(function(){
	clearInterval(scrtime);
},function(){
scrtime = setInterval(function(){
	var $ul = $(".ggao-container ul");
	var liHeight = $ul.find("li:last").height();
	$ul.animate({marginTop : liHeight + 30 + "px"},1000,function(){
		$ul.find("li:last").prependTo($ul)
		$ul.find("li:first").hide();
		$ul.css({marginTop:0});
		$ul.find("li:first").fadeIn(1000);
	});
},4000);
}).trigger("mouseleave");