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
<form method="post" action="${path}/admin/bankuai/index.do">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 板块管理</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
          <a class="button border-green" href="${path}/admin/bankuai/toupdateoradd.do" ><span class="icon-edit"></span> 添加</a>
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="120">父名称</th>       
        <th>名称</th>       
        <th>图标</th>       
        <th>主题管理</th>       
        <th>描述</th>       
        <th>创建时间</th>
        <th>排序</th>
        <th>操作</th>       
      </tr>      
      <c:forEach items="${page.list}" var="bankuai" >
        <tr>
          <td>  ${bankuai.parentname}</td>
          <td>${bankuai.name}</td>
          <td><c:if test="${bankuai.img!=''}">
          	<img src="${path}/file/${bankuai.img}" width="100px;" alt="${bankuai.name}" />
          </c:if></td>
          <td>
          <c:if test="${bankuai.parentId!=0}">
	          <a class="button border-main" href="${path}/admin/zhuti/index.do?bankuaiId=${bankuai.id}"><span class="icon-edit"></span>主题管理</a>
          </c:if>
          </td>
          <td>${bankuai.descs}</td>
          <td>${bankuai.createTime}</td>
          <td>${bankuai.orderBy}</td>
          <td><div class="button-group"> 
          <a class="button border-main" href="${path}/admin/bankuai/toupdateoradd.do?id=${bankuai.id}"><span class="icon-edit"></span> 修改</a>
          <a class="button border-red" href="javascript:void(0)" onclick="del(${bankuai.id})"><span class="icon-trash-o"></span> 删除</a> </div></td>
        </tr>
      </c:forEach>
      <tr>
        <td colspan="8">
			<jsp:include page="/WEB-INF/inc/page.jsp" flush="true"/>		
		</td>
      </tr>
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
			url :'${path}/admin/bankuai/del.do',
			data : param,
			dataType : 'json',
			success : function(datas) {
				if(datas==1){
					alert("删除成功");
					window.location.href='${path}/admin/bankuai/index.do';
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