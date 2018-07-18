<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head> 
  <title>${applicationScope.bbsinfo.indextitle}-${applicationScope.bbsinfo.name} </title> 
  <meta name="keywords" content="${applicationScope.bbsinfo.keywords}" /> 
  <meta name="baidu-site-verification" content="fDCbkFFyje" />
  <meta name="description" content="${applicationScope.bbsinfo.description} " /> 
  <link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_common.css" /> 
  <link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_forum_index.css" /> 
  <script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script> 
 </head> 
 <body id="nv_forum" class="pg_index">

 <%@ include file="/WEB-INF/inc/top.jsp"%>
 <div id="wp" class="wp"><div id="ct" class="wp cl w">
<div class="nfl">
<div class="f_c altw">
<div id="messagetext" class="alert_error">
<p>抱歉，您没有此操作权限</p></div><div><p></p>

<p class="alert_btnleft"><a href="javascript:history.back()">[ 点击这里返回上一页  ]</a></p>
</div>
</div>
</div>
</div>	</div>

<%@ include file="/WEB-INF/inc/foot.jsp"%>

 </body>
</html>