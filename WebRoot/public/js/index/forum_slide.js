


function _attachEvent(obj, evt, func, eventobj) {
	eventobj = !eventobj ? obj : eventobj;
	if(obj.addEventListener) {
		obj.addEventListener(evt, func, false);
	} else if(eventobj.attachEvent) {
		obj.attachEvent('on' + evt, func);
	}
}

function _detachEvent(obj, evt, func, eventobj) {
	eventobj = !eventobj ? obj : eventobj;
	if(obj.removeEventListener) {
		obj.removeEventListener(evt, func, false);
	} else if(eventobj.detachEvent) {
		obj.detachEvent('on' + evt, func);
	}
}


function getEvent() {
	if(document.all) return window.event;
	func = getEvent.caller;
	while(func != null) {
		var arg0 = func.arguments[0];
		if (arg0) {
			if((arg0.constructor  == Event || arg0.constructor == MouseEvent) || (typeof(arg0) == "object" && arg0.preventDefault && arg0.stopPropagation)) {
				return arg0;
			}
		}
		func=func.caller;
	}
	return null;
}

function isUndefined(variable) {
	return typeof variable == 'undefined' ? true : false;
}

function in_array(needle, haystack) {
	if(typeof needle == 'string' || typeof needle == 'number') {
		for(var i in haystack) {
			if(haystack[i] == needle) {
					return true;
			}
		}
	}
	return false;
}








function announcement() {
	var ann = new Object();
	ann.anndelay = 3000;ann.annst = 0;ann.annstop = 0;ann.annrowcount = 0;ann.anncount = 0;ann.annlis = document.getElementById('anc').getElementsByTagName("li");ann.annrows = new Array();
	ann.announcementScroll = function () {
		if(this.annstop) {this.annst = setTimeout(function () {ann.announcementScroll();}, this.anndelay);return;}
		if(!this.annst) {
			var lasttop = -1;
			for(i = 0;i < this.annlis.length;i++) {
				if(lasttop != this.annlis[i].offsetTop) {
					if(lasttop == -1) lasttop = 0;
					this.annrows[this.annrowcount] = this.annlis[i].offsetTop - lasttop;this.annrowcount++;
				}
				lasttop = this.annlis[i].offsetTop;
			}
			if(this.annrows.length == 1) {
				document.getElementById('an').onmouseover = document.getElementById('an').onmouseout = null;
			} else {
				this.annrows[this.annrowcount] = this.annrows[1];
				document.getElementById('ancl').innerHTML += document.getElementById('ancl').innerHTML;
				this.annst = setTimeout(function () {ann.announcementScroll();}, this.anndelay);
				document.getElementById('an').onmouseover = function () {ann.annstop = 1;};
				document.getElementById('an').onmouseout = function () {ann.annstop = 0;};
			}
			this.annrowcount = 1;
			return;
		}
		if(this.annrowcount >= this.annrows.length) {
			document.getElementById('anc').scrollTop = 0;
			this.annrowcount = 1;
			this.annst = setTimeout(function () {ann.announcementScroll();}, this.anndelay);
		} else {
			this.anncount = 0;
			this.announcementScrollnext(this.annrows[this.annrowcount]);
		}
	};
	ann.announcementScrollnext = function (time) {
		document.getElementById('anc').scrollTop++;
		this.anncount++;
		if(this.anncount != time) {
			this.annst = setTimeout(function () {ann.announcementScrollnext(time);}, 10);
		} else {
			this.annrowcount++;
			this.annst = setTimeout(function () {ann.announcementScroll();}, this.anndelay);
		}
	};
	ann.announcementScroll();
}


if(isUndefined(sliderun)) {
	var sliderun = 1;

	function slide() {

		var s = new Object();
		s.slideId = Math.random();
		s.slideSpeed = slideSpeed;
		s.size = slideImgsize;
		s.imgs = slideImgs;
		s.imgLoad = new Array();
		s.imgnum = slideImgs.length;
		s.imgLinks = slideImgLinks;
		s.imgTexts = slideImgTexts;
		s.slideBorderColor = slideBorderColor;
		s.slideBgColor = slideBgColor;
		s.slideSwitchColor = slideSwitchColor;
		s.slideSwitchbgColor = '#eee';
		s.slideSwitchHiColor = '#F35B4F';
		s.currentImg = 0;
		s.prevImg = 0;
		s.imgLoaded = 0;
		s.st = null;

		s.loadImage = function () {
			if(!s.imgnum) {
				return;
			}
			s.size[0] = parseInt(s.size[0]);
			s.size[1] = parseInt(s.size[1]);
			document.write('<div class="slideouter" id="outer_'+s.slideId+'" style="cursor:pointer;position:absolute;width:'+(s.size[0])+'px;height:'+(s.size[1])+'px;"></div>');
			document.write('<table cellspacing="0" cellpadding="0" style="cursor:pointer;width:'+s.size[0]+'px;height:'+s.size[1]+'px;table-layout:fixed;overflow:hidden;background:'+s.slideBgColor+';text-align:center"><tr><td valign="middle" style="padding:0" id="slide_'+s.slideId+'">');
			document.write((typeof IMGDIR == 'undefined' ? '' : '<img src="css/img/icon/refresh.png"/*tpa=http://www.dzzsk.com/demo/simple/template/qu_simple/img/js/template/qu_simple/img/icon/loading.gif*/ />') + '<br /><span id="percent_'+s.slideId+'">0%</span></td></tr></table>');
			document.write('<div id="switch_'+s.slideId+'" style="position:absolute;left:90px;top:175px;"></div>');
			document.getElementById('outer_' + s.slideId).onclick = s.imageLink;
			for(i = 1;i < s.imgnum;i++) {
				switchdiv = document.createElement('div');
				switchdiv.id = 'switch_' + i + '_' + s.slideId;
				switchdiv.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=70)';
				switchdiv.style.opacity = 0.8;
				switchdiv.style.styleFloat = 'left';
				switchdiv.style.cssFloat = 'left';
				switchdiv.style.cursor = 'pointer';
				switchdiv.style.width = '12px';
				switchdiv.style.height = '12px';
				switchdiv.style.marginRight = '5px';
				switchdiv.style.borderRadius = '50%';
				switchdiv.style.overflow = 'hidden';
				switchdiv.style.fontWeight = 'bold';
				switchdiv.style.textAlign = 'center';
				switchdiv.style.fontSize = '0';
				switchdiv.style.color = s.slideSwitchColor;
				switchdiv.style.borderRight = '0px solid ' + s.slideBorderColor;
				switchdiv.style.borderTop = '0px solid ' + s.slideBorderColor;
				switchdiv.style.backgroundColor = s.slideSwitchbgColor;
				switchdiv.className = 'slideswitch';
				switchdiv.i = i;
				switchdiv.onclick = function () {
					s.switchImage(this);
				};
				switchdiv.innerHTML = i;
				document.getElementById('switch_'+s.slideId).appendChild(switchdiv);
				s.imgLoad[i] = new Image();
				s.imgLoad[i].src = s.imgs[i];
				s.imgLoad[i].onerror = function () { s.imgLoaded++; };
			}
			s.loadCheck();
		};

		s.imageLink = function () {
			window.open(s.imgLinks[s.currentImg]);
		};

		s.switchImage = function (obj) {
			s.showImage(obj.i);
			s.interval();
		};

		s.loadCheck = function () {
			for(i = 1;i < s.imgnum;i++) {
				if(s.imgLoad[i].complete && !s.imgLoad[i].status) {
					s.imgLoaded++;
					s.imgLoad[i].status = 1;
					zrs = s.imgLoad[i].width / s.imgLoad[i].height;
					zrl = s.size[0] / s.size[1];
					if(zrs > zrl) {
						s.imgLoad[i].height = s.size[1];
					}
					else{
						s.imgLoad[i].width = s.size[0];
					}
				}
			}
			if(s.imgLoaded < s.imgnum - 1) {
				document.getElementById('percent_' + s.slideId).innerHTML = (parseInt(s.imgLoad.length / s.imgnum * 100)) + '%';
				setTimeout(function () { s.loadCheck(); }, 100);
			} else {
				for(i = 1;i < s.imgnum;i++) {
					s.imgLoad[i].onclick = s.imageLink;
					s.imgLoad[i].title = s.imgTexts[i];
				}
				s.showImage();
				s.interval();
			}
		};

		s.interval = function () {
			clearInterval(s.st);
			s.st = setInterval(function () { s.showImage(); }, s.slideSpeed);
		};

		s.showImage = function (i) {
			if(!i) {
				s.currentImg++;
				s.currentImg = s.currentImg < s.imgnum ? s.currentImg : 1;
			} else {
				s.currentImg = i;
			}
			if(s.prevImg) {
				document.getElementById('switch_' + s.prevImg + '_' + s.slideId).style.backgroundColor = s.slideSwitchbgColor;
			}
			document.getElementById('switch_' + s.currentImg + '_' + s.slideId).style.backgroundColor = s.slideSwitchHiColor;
			document.getElementById('slide_' + s.slideId).innerHTML = '';
			document.getElementById('slide_' + s.slideId).appendChild(s.imgLoad[s.currentImg]);
			s.prevImg = s.currentImg;
		};
		s.loadImage();

	}
}

slide();