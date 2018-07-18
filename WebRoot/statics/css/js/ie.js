var browser=navigator.appName;
var b_version=navigator.appVersion;
var version=b_version.split(";");  
var trim_Version=version[1].replace(/[ ]/g,"");
trim_Version = trim_Version.replace(" ","");
browser=browser.replace(" ","");
if((browser.replace(" ","")=="MicrosoftInternetExplorer") && (trim_Version.replace(" ","")=="MSIE6.0"||trim_Version.replace(" ","")=="MSIE7.0"||trim_Version.replace(" ","")=="MSIE8.0")){
	document.writeln("<div class=\"chromeframe\">您的浏览器版本太低，为了更好的用户体验，请使用高版本浏览器。例如： <a href=\"http://browsehappy.com/\" target=\"_blank\">升级浏览器</a> 或 <a href=\"http://www.google.com/chromeframe/?redirect=true\" target=\"_blank\">谷歌</a> 或 <a href=\"http://old.90plus.cn/\" target=\"_blank\">访问老版本</a></div>");
}