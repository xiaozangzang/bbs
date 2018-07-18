
function showhidediv(){
	$("#login_user_menu").slideToggle('fast');
}


function myEvent(obj,ev,fn){
	if(obj.attachEvent){
		obj.attachEvent('on'+ev,fn);
	}else{
		obj.addEventListener(ev,fn,false);
	}
}
myEvent(window,'load',function(){
	var oRTT=document.getElementById('scrolltopa');
	var pH=document.documentElement.clientHeight;
	var timer=null;
	var scrollTop;
	window.onscroll=function(){
		scrollTop=document.documentElement.scrollTop||document.body.scrollTop;
		//if(scrollTop>=pH){
		if(scrollTop>=1){
			oRTT.style.display='block';
		}else{
			oRTT.style.display='none';
		}
		return scrollTop;
	};
	oRTT.onclick=function(){
		clearInterval(timer);
		timer=setInterval(function(){
			var now=scrollTop;
			var speed=(0-now)/10;
			speed=speed>0?Math.ceil(speed):Math.floor(speed);
			if(scrollTop==0){
				clearInterval(timer);
			}
			document.documentElement.scrollTop=scrollTop+speed;
			document.body.scrollTop=scrollTop+speed;
		}, 30);
	}
});
