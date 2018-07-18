<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  
<title>个人资料-${applicationScope.bbsinfo.name}</title>
 <meta name="keywords" content="个人资料" /> 
  <meta name="description" content="个人资料" /> 
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_common.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_home_space.css" /> 
<script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="${path}/public/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/public/js/ajaxfileupload.js"></script>
<script type="text/javascript">
    function ajaxFileUpload(id) {
    	$.ajaxFileUpload({
    		url : '<%=request.getContextPath()%>/upload/uploadimg.do',
    		secureuri : false,
    		fileElementId : id,
    		dataType : 'json',
    		success : function(data, status) {
    			var isok=data.isok;
    			if(isok==1){
    				$("#img1").attr("src","<%=request.getContextPath()%>/file/"+data.path);
    				$("#img").val(data.path);
    			}
    		},
    		error : function(data, status, e) {
    			alert('上传出错');
    		}
    	});
    	return false;
    }
</script>
</head>
 <body id="nv_forum" class="pg_index">
 <%@ include file="/WEB-INF/inc/top.jsp"%>
  <div id="wp" class="wp">
   <div id="pt" class="bm cl"> 
    <div class="z"> 
     <a href="${path}/" class="nvhm" title="首页">首页</a> 
     <em>›</em> 
     <a href="${path}/user/index.do">设置</a> 
     <em>›</em>个人资料 
    </div> 
   </div> 
   <div id="ct" class="ct2_a wp cl"> 
    <div class="mn"> 
     <div class="bm bw0"> 
      <h1 class="mt">个人资料 </h1> 
      <ul class="tb cl"> 
       <li class="a"><a href="">基本资料</a></li> 
      </ul>
      <form action="${path}/user/update.do" method="post" > 
       <table cellspacing="0" cellpadding="0" class="tfm" id="profilelist"> 
        <tbody>
         <tr> 
          <th>用户名</th> 
          <td>${sessionScope.indexuser.loginname}</td> 
          <td>&nbsp;</td> 
         </tr>
         <tr id="tr_realname"> 
          <th id="th_realname">真实姓名</th> 
          <td id="td_realname"> 
          <input type="text" name="name" id="name" class="px" value="${sessionScope.indexuser.name}"  />
           <div class="rq mtn" id="showerror_realname"></div><p class="d"></p></td> 
         </tr> 
         <tr id="tr_realname"> 
          <th id="th_realname">头像</th> 
          <td id="td_realname"> 
          <input type="hidden" name="img" id="img" class="px" value="${sessionScope.indexuser.img}"  />
          <img src="<%=request.getContextPath()%>/file/${sessionScope.indexuser.img}" width="80px;" id="img1" />
           <input type="file"  id="file" name="file" onchange="ajaxFileUpload('file')"/>
		  </td> 
         </tr> 
         <tr id="tr_gender"> 
          <th id="th_gender">性别</th> 
          <td id="td_gender"> 
          <select name="sex" id="sex" class="ps" tabindex="1">
          	<option value="0"  <c:if test="${sessionScope.indexuser.sex==0}">selected="selected"</c:if> >保密</option>
          	<option value="1" <c:if test="${sessionScope.indexuser.sex==1}">selected="selected"</c:if>>男</option>
          	<option value="2" <c:if test="${sessionScope.indexuser.sex==2}">selected="selected"</c:if>>女</option></select>
           <div class="rq mtn" id="showerror_gender"></div><p class="d"></p></td> 
         </tr> 
         <tr id="tr_birthday"> 
          <th id="th_birthday">生日</th> 
          <td id="td_birthday"> 
         <input name="birthday" id="birthday" value="${sessionScope.indexuser.birthday}"  onfocus="WdatePicker({skin:'YcloudRed',dateFmt:'yyyy-MM-dd'})"  class="Wdate"/>
           <div class="rq mtn" id="showerror_birthday"></div><p class="d"></p></td> 
         </tr> 
         <tr id="tr_birthday"> 
          <th id="th_birthday">邮箱</th> 
          <td id="td_birthday"> 
         <input name="email" id="email" value="${sessionScope.indexuser.email}"  class="px"/>
           <div class="rq mtn" id="showerror_birthday"></div><p class="d"></p></td> 
         </tr> 
         <tr id="tr_birthday"> 
          <th id="th_birthday">手机号</th> 
          <td id="td_birthday"> 
         <input name="mobile" id="mobile" value="${sessionScope.indexuser.mobile}"  class="px"/>
           <div class="rq mtn" id="showerror_birthday"></div><p class="d"></p></td> 
         </tr> 
         <tr id="tr_birthday"> 
          <th id="th_birthday">签名</th> 
          <td id="td_birthday"> 
         <input name="qianming" id="qianming" value="${sessionScope.indexuser.qianming}" class="px"/>
           <div class="rq mtn" id="showerror_birthday"></div><p class="d"></p></td> 
         </tr> 
         <tr> 
          <th>&nbsp;</th> 
          <td colspan="2"> 
          <button type="submit" name="profilesubmitbtn" id="profilesubmitbtn" value="true" class="pn pnc"><strong>保存</strong></button> 
          <span id="submit_result" class="rq" style="display: none;">提示信息</span>
           </td> 
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
       <li class="a"><a href="${path}/user/index.do">个人资料</a></li> 
       <li ><a href="${path}/user/topwd.do">密码安全</a></li> 
       <li><a href="${path}/user/jifen/index.do">积分</a></li> 
      </ul> 
     </div>
    </div> 
   </div> 
  </div>



<%@ include file="/WEB-INF/inc/foot.jsp"%>
 </body>
</html>