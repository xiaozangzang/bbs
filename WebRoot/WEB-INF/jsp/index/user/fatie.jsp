<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  
<title>发帖-${applicationScope.bbsinfo.name}</title>
 <meta name="keywords" content="发帖" /> 
  <meta name="description" content="发帖" /> 
 <link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_common.css" />
 <link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_forum_viewthread.css" /> 
 <link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_forum_forumdisplay.css" /> 
 <script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
 <script type="text/javascript" charset="utf-8" src="${path}/public/baiduueditor/ueditor.config.js"></script>
 <script type="text/javascript" charset="utf-8" src="${path}/public/baiduueditor/ueditor.all.min.js"></script>
 <script type="text/javascript" src="${path}/public/baiduueditor/lang/zh-cn/zh-cn.js"></script>
 <script type="text/javascript">
 function sysz(){
	 var name=$("#tzname").val();
	 var length=80-name.length;
	 if(length<0)length=0;
	 $("#checklen").html(length);
 }
 $(function(){
	 UE.getEditor('myEditor');
 });
 
 function geteditorhtml(){
	 $("#editorhtml").val(UE.getEditor('myEditor').getContent());
	 $("#editortxt").val(UE.getEditor('myEditor').getContentTxt());
	 var zhutiid=$("#zhutiid").val();
	 if(zhutiid=="0"){
		 alert("请选择主题");
		 $("#zhutiid").focus();
		 return;
	 }
	 var name=$.trim($("#tzname").val());
	 if(name==""){
		 alert("请输入标题");
		 $("#tzname").focus();
		 return;
	 }
	 var editorhtml=$.trim($("#editorhtml").val());
	 if(editorhtml==""){
		 alert("请输入内容");
		 UE.getEditor('myEditor').focus();
		 return;
	 }
	 $("#form").submit();
 }
 
 
 </script>
   
</head>
 <body id="nv_forum" class="pg_index">

 <%@ include file="/WEB-INF/inc/top.jsp"%>
 <div id="wp" class="wp"></div> 
  <div class="qing_forum_thumb cl" style="background:url(${path}/css/img/banner/common_2_banner.jpg) no-repeat center top;"> 
   <div class="wp cl"> 
    <div id="pt" class="cl"> 
     <div class="z"> 
      <a href="${path}/" class="nvhm" title="首页">首页</a> 
      <em>›</em> 
     	<a href="${path}/${bankuai.fid}.html">${bankuai.fname}</a>
      	<em>›</em> 
     	<a href="${path}/bk/${bankuai.id}_1_0_0.html">${bankuai.name}</a>
      <span class="qing_ptpip">今日: ${nowcount}  , 主题: ${page.totalRecords}</span> 
     </div> 
    </div> 
    <div class="qing_forum_second cl"> 
    <a href="javascript:;" class="pn pnc poster z" onclick="window.history.go(-1);">返回</a> 
     <ul id="thread_types" class="qttp y cl"> 
      <li id="ttp_all" class="xw1 a"><a href="">全部<span></span></a></li> 
      <c:forEach items="${zhutilist}" var="zhuti">
	      <li><a href="${zhuti.id}">${zhuti.name}<span></span></a></li> 
      </c:forEach>
     </ul> 
    </div> 
   </div> 
  </div> 
 <div id="wp" class="wp"> 
   <div id="f_pst" class="bm"> 
    <div class="bm_c"> 
     <form method="post" id="form" action="${path}/tz/add.do"> 
      <div id="fastpostreturn" style="margin:-5px 0 5px"></div> 
      <div class="pbt cl"> 
       <div class="ftid"> 
        <select name="zhutiid"  id="zhutiid"> 
         <option value="0" selected="selected">选择主题分类</option>
         <c:forEach items="${zhutilist}" var="zhuti">
	         <option value="${zhuti.id}">${zhuti.name}</option>
         </c:forEach>
       </select>
       </div> 
       <input type="text" id="tzname" name="name" class="px" maxlength="80"  tabindex="11" style="width: 560px;" onchange="sysz();" onkeydown="sysz();" onkeyup="sysz();"/> 
       <input type="hidden" id="editorhtml" name="contenthtml"/>
       <input type="hidden" id="editortxt" name="contenttxt"/>
       <input type="hidden" name="bankuaiId" value="${bankuaiId}"/>
       <span>还可输入 <strong id="checklen">80</strong> 个字符</span> 
      </div> 
      <div class="cl"> 
       <div id="fastsmiliesdiv" class="y">
        <div id="fastsmiliesdiv_data">
         <div id="fastsmilies"></div>
        </div>
       </div>
       <div class="hasfsl" id="fastposteditor"> 
        <div class="tedt"> 
			<script id="myEditor" type="text/plain" style="width:1000px;height:240px;"></script>
        </div> 
       </div> 
      </div> 
      <p class="ptm pnpost"> <button type="button"  name="topicsubmit"  class="pn pnc" onclick="geteditorhtml();"><strong>发表帖子</strong></button> </p>
      <p></p> 
     </form> 
    </div> 
   </div> 
  </div>


<%@ include file="/WEB-INF/inc/foot.jsp"%>

 </body>
</html>