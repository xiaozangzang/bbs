<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  
<title>积分规则</title>
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_common.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_home_spacecp.css" /> 
<link rel="stylesheet" href="${path }/admin/css/admin.css"/>
<script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="${path}/public/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
 <body id="nv_forum" class="pg_index">
 <%@ include file="/WEB-INF/inc/top.jsp"%>

  <div id="wp" class="wp">
   <div id="pt" class="bm cl"> 
    <div class="z"> 
     <a href="${path}/" class="nvhm" title="首页">首页</a> 
     <em>›</em> 
     <a href="${path}/user/index.do">设置</a> 
     <em>›</em><a href="${path}/user/jifen/index.do">积分</a>
     <em>›</em><a href="${path}/user/jifen/record.do">积分规则</a> 
    </div> 
   </div> 
   <div id="ct" class="ct2_a wp cl"> 
    <div class="mn"> 
     <div class="bm bw0"> 
      <h1 class="mt">积分 </h1> 
      <ul class="tb cl"> 
       <li ><a href="${path}/user/jifen/index.do">积分记录</a></li> 
       <li class="a"><a href="${path}/user/jifen/record.do">积分规则</a></li> 
      </ul>
      <form method="post" action="${path}/user/jifen/index.do"> 
       <div><span>积分规则如下：</span></div>
       <table cellspacing="0" cellpadding="0" class="dt"> 
        <tbody>
         <tr> 
          <th width="40%">操作</th> 
          <th width="60%">积分值</th> 
         </tr>
          <tr> 
	          <td>发帖</td> 
	          <td>+2</td>
          </tr>
          <tr>
          	<td>回复</td>
          	<td>+1</td>
          </tr>
          <tr>
          	<td>精华</td>
          	<td>+2</td>
          </tr>
          <tr>
          	<td>登录</td>
          	<td>+2</td>
       	</tr>
        </tbody>
       </table> 
      </form> 
     </div> 
    </div> 
    <div class="appl">
     <div class="tbn"> 
      <h2 class="mt bbda">设置</h2> 
      <ul> 
       <li><a href="${path}/user/index.do">个人资料</a></li> 
       <li><a href="${path}/user/topwd.do">密码安全</a></li> 
       <li class="a"><a href="${path}/user/jifen/index.do">积分</a></li>  
      </ul> 
     </div>
    </div> 
   </div> 
  </div>
<%@ include file="/WEB-INF/inc/foot.jsp"%>
 </body>
</html>