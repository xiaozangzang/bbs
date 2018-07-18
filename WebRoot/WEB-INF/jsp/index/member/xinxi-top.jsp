<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
 <div id="uhd"> 
   <script>
		var qm = 10;
		var qn = Math.floor(Math.random()*qm+1);
		document.write ("<div class=\"qing_profile cl\" style=\"width:100%;background:url(${path}/css/img/banner/b_"+qn+".jpg) no-repeat center top;\">");
	</script> 
   <div class="icn"> 
    <a href=""><img src="<%=request.getContextPath()%>/file/${user.img}" /></a> 
   </div> 
   <h2 class="cl mt">${user.loginname}</h2> 
   <p class="cl"> </p> 
   <p class="q_hdmenu mt cl"> 
     <a href="javascript:" class="newbtn">收听TA</a>
     <a href="javascript:"   class="newbtn">加为好友</a>  
     <a href="javascript:;" title="发送消息" class="oldbtn">发送消息</a> </p> 
  </div> 
