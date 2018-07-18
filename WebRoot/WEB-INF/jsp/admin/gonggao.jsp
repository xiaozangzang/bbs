<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
    <title>公告信息</title>  
    <link rel="stylesheet" href="${path }/admin/css/pintuer.css"/>
    <link rel="stylesheet" href="${path }/admin/css/admin.css"/>
    <script type="text/javascript" src="${path }/public/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${path }/admin/js/pintuer.js"></script> 
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/js/ajaxfileupload.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 公告管理</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="${path}/admin/gonggao/update.do">
      
      <div class="form-group">
        <div class="label">
          <label>公告内容：</label>
        </div>
        <div class="field">
          <textarea name="content" class="input" style="height:200px;width: 400px;">${gonggao.content}</textarea>
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