<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
    <link rel="stylesheet" href="${path }/admin/css/pintuer.css"/>
    <link rel="stylesheet" href="${path }/admin/css/admin.css"/>
    <script src="${path }/public/js/jquery-1.8.2.min.js"></script>
    <script src="${path }/admin/js/pintuer.js"></script>  
</head>
<body>
<form method="post" action="${path}/adminbankuai/index.do">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">主题管理</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
          <a class="button border-green" href="${path}/admin/zhuti/toupdateoradd.do?bankuaiId=${bankuaiId}" ><span class="icon-edit"></span> 添加</a>
          <button class="button border-red icon-tags" type="button" onclick="window.history.go(-1);"> 返回</button>
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="120">名称</th>       
        <th>创建时间</th>
        <th>排序</th>
        <th>操作</th>       
      </tr>      
      <c:forEach items="${list}" var="zhuti" >
        <tr>
          <td>${zhuti.name}</td>
          <td>${zhuti.createtime}</td>
          <td>${zhuti.orderby}</td>
          <td><div class="button-group"> 
          <a class="button border-main" href="${path}/admin/zhuti/toupdateoradd.do?id=${zhuti.id}"><span class="icon-edit"></span> 修改</a>
          <a class="button border-red" href="javascript:void(0)" onclick="del(${zhuti.id})"><span class="icon-trash-o"></span> 删除</a> </div></td>
        </tr>
      </c:forEach>
    </table>
  </div>
</form>
<script type="text/javascript">

function del(id){
	if(confirm("您确定要删除吗?")){
		var param = {};
		param.id=id;
		$.ajax({
			type : "post",
			url :'${path}/admin/zhuti/del.do',
			data : param,
			dataType : 'json',
			success : function(datas) {
				if(datas==1){
					alert("删除成功");
					window.location.href='${path}/admin/zhuti/index.do?bankuaiId=${bankuaiId}';
				}else{
					alert("该版块有子板块禁止删除");
				}
			}
		});
		
		
	}
}

function gotopage(url){
	window.location.href=url;
}

</script>
</body></html>