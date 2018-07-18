<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
    <title>网站信息</title>  
    <link rel="stylesheet" href="${path }/admin/css/pintuer.css"/>
    <link rel="stylesheet" href="${path }/admin/css/admin.css"/>
    <script type="text/javascript" src="${path }/public/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${path }/admin/js/pintuer.js"></script> 
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
	</script> 
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 网站信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="${path}/admin/info/update.do">
      <div class="form-group">
        <div class="label">
          <label>网站名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="name" value="${info.name}" />
          <div class="tips"><span style="color: red">*</span>网站名称</div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>网站标题：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="indextitle" value="${info.indextitle}" />
          <div class="tips"><span style="color: red">*</span>首页标题名称</div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>网站LOGO：</label>
        </div>
        <div class="field">
          <input type="text" id="img1" name="logoimg" class="input tips" style="width:25%; float:left;" value="${info.logoimg}" data-toggle="hover" data-place="right"  data-image="<%=request.getContextPath()%>/file/${info.logoimg}" readonly="readonly" />
          <input type="file"  id="file" name="file" onchange="ajaxFileUpload('file')"/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>网站关键字：</label>
        </div>
        <div class="field">
          <textarea class="input" name="keywords" style="height:80px">${info.keywords}</textarea>
          <div class="tips"><span style="color: red">*</span>首页seo显示关键字</div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>网站描述：</label>
        </div>
        <div class="field">
          <textarea class="input" name="description">${info.description}</textarea>
          <div class="tips"><span style="color: red">*</span>首页seo显示描述</div>
        </div>
      </div>
     
              
      <div class="form-group">
        <div class="label">
          <label>底部信息：</label>
        </div>
        <div class="field">
          <textarea name="foothtml" class="input" style="height:120px;">${info.foothtml}</textarea>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>