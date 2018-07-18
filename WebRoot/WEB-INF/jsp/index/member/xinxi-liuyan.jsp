<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  
<title>${user.name}的留言--${applicationScope.bbsinfo.name}</title>
<meta name="keywords" content="${user.loginname}的留言" /> 
<meta name="description" content="${user.loginname}的留言" /> 
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_common.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_home_space.css" /> 
<link rel="stylesheet" type="text/css" href="${path}/public/css/tubiao.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_forum_viewthread.css" /> 
<script type="text/javascript" src="${path}/public/js/jquery-1.8.2.min.js" ></script>
 <script type="text/javascript" charset="utf-8" src="${path}/public/baiduueditor/ueditor.config.huifu.js"></script>
 <script type="text/javascript" charset="utf-8" src="${path}/public/baiduueditor/ueditor.all.min.js"></script>
 <script type="text/javascript" src="${path}/public/baiduueditor/lang/zh-cn/zh-cn.js"></script>
 <script type="text/javascript" src="${path}/public/layer/layer.js"></script>
<script type="text/javascript">
function submitliuyan(){
	var createuserid=$("#createuserid").val();
	var liuyanuserid=$("#liuyanuserid").val();
	var contenthtml=$.trim($("#contenthtml").val());
	if(createuserid==""){
		$("#return_qcwall_24").html("请注册登陆后留言");
		$("#return_qcwall_24").show();
		return;
	}else{
		$("#return_qcwall_24").hide();
	}
	if(contenthtml==""){
		$("#return_qcwall_24").html("请填写留言内容");
		$("#return_qcwall_24").show();
		return;
	}else if(contenthtml.length>500){
		$("#return_qcwall_24").html("留言内容不能大于500个汉字");
		$("#return_qcwall_24").show();
		return;
	}else{
		$("#return_qcwall_24").hide();
	}
	
	
	var param={};
	 param.liuyanuserid=liuyanuserid;
	 param.contenthtml=contenthtml;
	 $.ajax({
		   type: "POST",
		   url: "${path}/user/liuyan/add.do",
		   data: param,
		   success: function(){
				window.location.reload();				   
		   }
	 });
}

function delliuyan(id){
	var param={};
	 param.id=id;
	 $.ajax({
		   type: "POST",
		   url: "${path}/user/liuyan/del.do",
		   data: param,
		   success: function(){
				window.location.reload();				   
		   }
	 });
}
</script>
</head>
 <body id="nv_forum" class="pg_index">

 <%@ include file="/WEB-INF/inc/top.jsp"%>
  <%@ include file="/WEB-INF/jsp/index/member/xinxi-top.jsp"%>
  <div id="wp" class="wp"> 
   <div class="qing_space_tb cl"> 
    <ul class="tb cl"> 
     <li><a href="${path}/member/${user.id}_1.html">个人资料</a></li> 
     <li><a href="${path}/member/${user.id}_2.html">帖子</a></li> 
     <li class="a"><a href="${path}/member/${user.id}_3.html">留言板</a></li> 
    </ul> 
   </div>
   
    <div id="ct" class="ct1 wp cl"> 
   <div class="mn"> 
    <div class="bm bw0"> 
     <div class="bm_c"> 
      <form action="" method="post" > 
       <div class="tedt mtn mbn"> 
        <div class="area"> 
         <textarea id="contenthtml"  rows="5" class="pt"></textarea> 
        </div> 
       </div> 
       <p> 
       	  <input type="hidden" value="${user.id}" id="liuyanuserid" />
       	  <input type="hidden" value="${sessionScope.indexuser.id}" id="createuserid" />
         <button type="button" class="pn" onclick="submitliuyan();" ><strong>留言</strong></button> 
         <span id="return_qcwall_24" style="display: none;color: red;">提示内容</span> </p> 
      </form> 
      <hr class="da mtm m0" /> 
      <div id="div_main_content" class="mtm mbm"> 
       <div id="comment"> 
        <div id="comment_ul" class="xld xlda" >
        
        <c:forEach items="${liuyanlist}" var="map" >
        
         <dl id="comment_11_li" class="bbda cl">
          <dd class="m avt">
           <img src="<%=request.getContextPath()%>/file/${map.img}" />
          </dd> 
          <dt> 
           <span class="y xw0"> 
           <c:if test="${sessionScope.indexuser.groupid==1 or sessionScope.indexuser.groupid==2 or sessionScope.indexuser.id==map.liuyanuserid or sessionScope.indexuser.id==map.createuserid}">
             <a href="javascript:;"  onclick="delliuyan('${map.id}')">删除</a> 
           </c:if>
           <c:if test="${sessionScope.indexuser.groupid==1 or sessionScope.indexuser.groupid==2 or sessionScope.indexuser.id==map.liuyanuserid or sessionScope.indexuser.id==map.createuserid}">
	            	<a href="javascript:;" onclick="addhuifu(${map.id})">回复</a> 
           </c:if>
            </span> 
           <a href="${path}/member/${map.createuserid}_1.html" id="author_11">${map.loginname}</a> 
           <span class="xg1 xw0">${map.createtime}</span> 
          </dt> 
          <dd id="comment_11">
          		${map.contenthtml}
          </dd>
          <div id="po_257" class="po"> 
           <div class="pob cl"> 
           </div> 
          </div>
         </dl>
         </c:forEach>
        </div> 
       </div> 
       <div class="pgs cl mtm"></div> 
      </div> 
     </div> 
    </div> 
   </div> 
  </div>
  </div>
  	
<%@ include file="/WEB-INF/inc/foot.jsp"%>
 </body>
</html>