<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>后台管理中心-${applicationScope.bbsinfo.name}</title>  
    <link rel="stylesheet" href="${path }/admin/css/pintuer.css" />
    <link rel="stylesheet" href="${path }/admin/css/admin.css" />
    <script src="${path }/public/js/jquery-1.8.2.min.js"></script>   
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="${path }/admin/images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台管理中心</h1>
  </div>
  <div class="head-l">
  	<span>欢迎 ${sessionScope.indexuser.loginname}</span>&nbsp;&nbsp;
	  <a class="button button-little bg-green" href="${path }/" ><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;
  </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-pencil-square-o"></span>基本设置</h2>
  <ul style="display:block">
    <li><a href="${path}/admin/link/index.do" target="right"><span class="icon-caret-right"></span>友情链接</a></li>
    <li><a href="${path}/admin/bankuai/index.do" target="right"><span class="icon-caret-right"></span>板块管理</a></li>
     <li><a href="${path}/admin/info/index.do" target="right"><span class="icon-caret-right"></span>网站设置</a></li> 
     <li><a href="${path}/admin/gonggao/index.do" target="right"><span class="icon-caret-right"></span>公告管理</a></li> 
  </ul>   
  <h2><span class="icon-user"></span>用户管理</h2>
  <ul>
    <li><a href="${path}/admin/user/index.do" target="right"><span class="icon-caret-right"></span>用户管理</a></li>  
<!--     <li><a href="book.jsp" target="right"><span class="icon-caret-right"></span>分类管理</a></li>   -->      
  </ul>  
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  <li><a href="${path}/" target="right" class="icon-home"> 首页</a></li>
  <li><a href="#" id="a_leader_txt">网站信息</a></li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="${path}/admin/link/index.do" name="right" width="100%" height="100%"></iframe>
</div>
</body>
</html>