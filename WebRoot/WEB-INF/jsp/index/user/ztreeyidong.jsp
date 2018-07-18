<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>移动帖子-${applicationScope.bbsinfo.name} </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${path}/public/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${path}/public/ztree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${path}/public/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${path}/public/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript">
		var setting = {
			check: {
				enable: true,
				chkStyle: "radio",
				radioType: "all"
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		};
		$(document).ready(function(){
			var inputzNodes=$("#zNodes").val();
			var aaa=eval('(' + inputzNodes + ')');
			$.fn.zTree.init($("#tree"), setting, aaa);
		});
		
		function colselayer(){
			var index = parent.layer.getFrameIndex(window.name);  
			parent.layer.close(index);
		}
		function updatebanuai(){
			var tieziid=$("#tieziid").val();
			var treeObj = $.fn.zTree.getZTreeObj("tree");
			var nodes = treeObj.getCheckedNodes(true);
			var param={};
			 param.zhutiid=nodes[0].id;
			 param.tieziid=tieziid;
			 $.ajax({
				   type: "POST",
				   url: "${path}/moderator/common/updatebankuai.do",
				   data: param,
				   dataType: "json", 
				   success: function(data){
					   colselayer();
					   window.parent.location.reload();
				   }
			 });
		}
	</script>
</head>
<body>
	<div>
		<ul id="tree" class="ztree"></ul>
		<input type="hidden" id="zNodes" value='${zNodes}'>
	</div>
	<div>
	<input type="hidden" id="tieziid" value="${tieziid}">
	<input type="button" value="确定" onclick="updatebanuai();">
	<input type="button" value="关闭" onclick="colselayer();">
	</div>
</body>
</html>