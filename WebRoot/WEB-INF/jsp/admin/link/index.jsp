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
<form method="post" action="${path}/admin/link/index.do">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 友情链接管理</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
          <a class="button border-green" href="${path}/admin/link/toupdateoradd.do" ><span class="icon-edit"></span> 添加</a>
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>id</th>       
        <th>名称</th>       
        <th>链接</th>       
        <th>创建人</th>       
        <th>创建时间</th>       
        <th>排序</th>       
        <th>是否前台显示</th>       
        <th>操作</th>     
      </tr>      
      <c:forEach items="${page.list}" var="link" >
        <tr>
          <td>${link.id}</td>
          <td>${link.name}</td>
          <td>${link.link}</td>
          <td>${link.username}</td>
          <td>${link.createtime}</td>
          <td>${link.orderby}</td>
          <td>
          <c:if test="${link.isshow==0}">
          	失效
          </c:if>
          <c:if test="${link.isshow==1}">
          	显示
          </c:if>
          
          </td>
          <td><div class="button-group"> 
          <c:if test="${link.isshow==0}">
          	<a class="button border-main" href="javascript:void(0)" onclick="updateshow(${link.id},'1')"><span class="icon-edit"></span>显示</a>
          </c:if>
          <c:if test="${link.isshow==1}">
          	<a class="button border-main" href="javascript:void(0)" onclick="updateshow(${link.id},'0')"><span class="icon-edit"></span>失效</a>
          </c:if>
          <a class="button border-main" href="${path}/admin/link/toupdateoradd.do?id=${link.id}"><span class="icon-edit"></span> 修改</a>
          <a class="button border-red" href="javascript:void(0)" onclick="del(${link.id})"><span class="icon-trash-o"></span> 删除</a>
           </div></td>
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
			url :'${path}/admin/link/del.do',
			data : param,
			dataType : 'json',
			success : function(datas) {
				if(datas==1){
					alert("删除成功");
					window.location.href='${path}/admin/link/index.do';
				}else{
					alert("该版块有子板块禁止删除");
				}
			}
		});
	}
}
function updateshow(id,show){
		var param = {};
		param.id=id;
		param.isshow=show;
		$.ajax({
			type : "post",
			url :'${path}/admin/link/updateoradd.do',
			data : param,
			dataType : 'html',
			success : function(datas) {
					window.location.href='${path}/admin/link/index.do';
			}
		});
}



function gotopage(url){
	window.location.href=url;
}

</script>
</body></html>