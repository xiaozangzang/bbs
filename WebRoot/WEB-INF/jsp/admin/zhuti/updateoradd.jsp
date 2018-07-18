<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
    <title>网站信息</title>  
    <link rel="stylesheet" href="${path }/admin/css/pintuer.css"/>
    <link rel="stylesheet" href="${path }/admin/css/admin.css"/>
    <script src="${path }/public/js/jquery-1.8.2.min.js"></script>
    <script src="${path }/admin/js/pintuer.js"></script>  
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/js/ajaxfileupload.js"></script>
    
    <script type="text/javascript">
    function yanzheng(){
    	var name=$("#name").val();
    	var orderby=$("#orderby").val();
    	if($.trim(name)==""){
    		alert("名称不能为空");
    		return;
    	}
    	if($.trim(orderby)!=""&&isNaN(orderby)){
    		alert("顺序号必须为数字");
    		return;
    	}
    	$("#form").submit();
    }
    
    function ajaxFileUpload(id) {
    	$.ajaxFileUpload({
    		url : '<%=request.getContextPath()%>/upload/uploadimg.do',
    		secureuri : false,
    		fileElementId : id,
    		dataType : 'json',
    		success : function(data, status) {
    			var isok=data.isok;
    			if(isok==1){
    				$("#img1").attr("data-image","<%=request.getContextPath()%>/file/"+data.path);
    				$("#img1").val(data.path);
    			}
    		},
    		error : function(data, status, e) {
    			alert('上传出错');
    		}
    	});
    	return false;
    }
    
  $(function(){
	var dataimg=$("#img1").attr("data-image")
	if(dataimg!=""){
		$("#img1").attr("data-image","<%=request.getContextPath()%>/file/"+dataimg);
	}	  
  });
    </script> 
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 网站信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="${path}/admin/zhuti/updateoradd.do" id="form">
      <div class="form-group">
        <div class="label">
          <label>名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="name" value="${zhuti.name}" size="100" id="name"/>
          <input type="hidden" name="id" value="${zhuti.id}"/>
          <input type="hidden" name="bankuaiId" value="${zhuti.bankuaiId}"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>排序：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="orderby" value="${zhuti.orderby}" size="10" id="orderby"/>
          <div class="tips">如为空则按顺序排列</div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button border-main icon-check-square-o" type="button" onclick="yanzheng();"> 提交</button>
          <button class="button border-red icon-tags" type="button" onclick="window.history.go(-1);"> 返回</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>