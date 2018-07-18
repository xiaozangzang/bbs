<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>${applicationScope.bbsinfo.name}</title>
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_common.css" />
<link rel="stylesheet" type="text/css" href="${path}/public/css/tubiao.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_forum_viewthread.css" /> 
<script type="text/javascript" src="${path}/public/js/jquery-1.8.2.min.js" ></script>
 <script type="text/javascript" charset="utf-8" src="${path}/public/baiduueditor/ueditor.config.huifu.js"></script>
 <script type="text/javascript" charset="utf-8" src="${path}/public/baiduueditor/ueditor.all.min.js"></script>
 <script type="text/javascript" src="${path}/public/baiduueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
$(function(){
	  UE.getEditor('myEditor');
 });
 
function geteditorhtml(){
	 var editorhtml=UE.getEditor('myEditor').getContent();
	 var editortxt=UE.getEditor('myEditor').getContentTxt();
	 if(editorhtml==""){
		 alert("请输入内容");
		 UE.getEditor('myEditor').focus();
		 return;
	 }
	 var param={};
	 param.editorhtml=editorhtml;
	 param.editortxt=editortxt;
	 param.id='${id}';
	 param.huifuid='${huifuid}';
	 $.ajax({
		   type: "POST",
		   url: "${path}/tz/addhuifu.do",
		   data: param,
		   dataType: "json", 
		   async: false,
		   success: function(data){
			   if(data==1){
				   window.parent.location.reload();
			   }else if(data==0){
				   alert("该板块不允许发表回复");
			   }else{
				   alert("系统错误");
			   }
		   }
	 });
}

function gotologin(){
	window.location.href="${path}/login/index.do?pathlocation=${path}/tiezi/${map.tiezi.id}_1_1.html";
}

</script>
</head>
 <body>
      <table cellspacing="0" cellpadding="0"> 
       <tbody>
       <c:if test="${sessionScope.indexuser!=null}">
       <!-- 允许回复 -->
        <tr> 
         <td class="plc"> <span id="fastpostreturn"></span> 
          <div class="cl"> 
           <div id="fastsmiliesdiv" class="y">
            <div id="fastsmiliesdiv_data">
             <div id="fastsmilies"></div>
            </div>
           </div>
           <div class="hasfsl" id="fastposteditor"> 
            <div class="tedt mtn"> 
             <div class="tedt"> 
				<div id="myEditor" style="width:850px;height:200px;"></div>
        	</div> 
            </div> 
           </div> 
          </div> 
           <p class="ptm pnpost"> 
           <button type="button" class="pn pnc vm" onclick="geteditorhtml();" ><strong>发表回复</strong></button> 
             </p> </td> 
        </tr>
       </c:if>
       </tbody>
      </table> 
 </body>
</html>