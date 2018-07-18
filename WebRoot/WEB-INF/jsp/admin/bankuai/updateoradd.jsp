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
    function huifucheckboxalla(){
    	$("input[name='huifucheckboxall']").each(function(){   
	    	if(this.checked==true){
	    		 $("input[name='huifucheckbox']").each(function(){   
	                 this.checked=true;  
	             });
	    	}else{
	    		$("input[name='huifucheckbox']").each(function(){   
	                 this.checked=false;  
	             });
	    	}
        });
    }
    function fatiecheckboxalla(){
    	$("input[name='fatiecheckboxall']").each(function(){   
	    	if(this.checked==true){
	    		 $("input[name='fatiecheckbox']").each(function(){   
	                 this.checked=true;  
	             });
	    	}else{
	    		$("input[name='fatiecheckbox']").each(function(){   
	                 this.checked=false;  
	             });
	    	}
        });
    }
    
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
    	var fatiegroup ="";    
    	  $('input[name="fatiecheckbox"]:checked').each(function(){
    		  fatiegroup+=$(this).val()+",";
    	  });  
    	var huifugroup ="";    
    	  $('input[name="huifucheckbox"]:checked').each(function(){
    		  huifugroup+=$(this).val()+",";
    	  });  
    	  $("#fatiegroup").val(fatiegroup);
    	  $("#huifugroup").val(huifugroup);
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
	var fatiegroup=$("#fatiegroup").val();
	var huifugroup=$("#huifugroup").val();
	 $("input[name='fatiecheckbox']").each(function(){   
         if (fatiegroup.indexOf($(this).val()+',') >-1) {  
             this.checked=true;  
         }   
     });
	 $("input[name='huifucheckbox']").each(function(){   
         if (huifugroup.indexOf($(this).val()+',') >-1) {  
             this.checked=true;  
         }   
     });
  });
    </script> 
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 网站信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="${path}/admin/bankuai/updateoradd.do" id="form">
      <div class="form-group">
        <div class="label">
          <label>名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="name" value="${bankuai.name}" size="100" id="name"/>
          <input type="hidden" name="id" value="${bankuai.id}"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>父级板块：</label>
        </div>
        <div class="field">
	        <select class="input" name="parentId">
	        	<option value="0">无</option>
	        <c:forEach items="${parentList}" var="parent">
	        	<option value="${parent.id}"  <c:if test="${bankuai.parentId==parent.id}">selected="selected"</c:if> >${parent.name}</option>
	        </c:forEach>
	        </select>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>板块LOGO：</label>
        </div>
        <div class="field">
          <input type="text" id="img1" name="img" class="input tips" style="width:25%; float:left;" value="${bankuai.img}" data-toggle="hover" data-place="right"  data-image="${bankuai.img}" readonly="readonly" />
          <input type="file"  id="file" name="file" onchange="ajaxFileUpload('file')"/>
          <!-- <input type="button" class="button bg-blue margin-left" id="image1" value="+ 浏览上传" onclick="ajaxFileUpload('file')" /> -->
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>描述：</label>
        </div>
        <div class="field">
          <textarea name="descs" class="input" style="height:120px;">${bankuai.descs}</textarea>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>发帖限制：</label>
        </div>
        <div class="field">
		  <input type="checkbox" name="fatiecheckboxall" onclick="fatiecheckboxalla();"/>全选
        <c:forEach items="${jifengouplist}" var="jifengoup">
		  <input type="checkbox" name="fatiecheckbox" value="f${jifengoup.id}"/>${jifengoup.name}
        </c:forEach>
        <input type="hidden" name="fatiegroup" id="fatiegroup" value="${bankuai.fatiegroup}"/>
          <div class="tips">如为空则不限制</div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>回复限制：</label>
        </div>
        <div class="field">
        <input type="checkbox" name="huifucheckboxall" onclick="huifucheckboxalla();"/>全选
        <c:forEach items="${jifengouplist}" var="jifengoup">
		  <input type="checkbox" name="huifucheckbox" value="h${jifengoup.id}"/>${jifengoup.name}
        </c:forEach>
        <input type="hidden" name="huifugroup" id="huifugroup" value="${bankuai.huifugroup}"/>
          <div class="tips">如为空则不限制</div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>排序：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="orderBy" value="${bankuai.orderBy}" size="10" id="orderby"/>
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