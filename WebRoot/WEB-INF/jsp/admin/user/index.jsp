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
<form method="post" action="${path}/admin/user/index.do" id="form">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 板块管理</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
        <input type="text" name="loginname" class="input" value="${quser.loginname}" placeholder="登陆名"/>
        </li>
        <li>
        <input type="text" name="name" class="input" value="${quser.name}" placeholder="名称"/>
        </li>
        <li>
        <input type="text" name="flag" class="input" value="${quser.flag}" placeholder="0是禁用1是正常"/>
        </li>
        <li>
          <a class="button border-green" href="javascript:;" onclick="submitform();" ><span class="icon-search"></span> 查询</a>
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="6%">登陆名</th>       
        <th width="6%">名称</th>       
        <th width="6%">头像</th>       
        <th width="6%">组别</th>       
        <th width="6%">最后登陆时间</th>       
        <th width="2%">最后登陆ip</th>       
        <th width="6%">注册时间</th>       
        <th width="2%">注册ip</th>       
        <th width="6%">标识</th>
        <th width="50%">操作</th>       
      </tr>      
      <c:forEach items="${page.list}" var="user" >
        <tr>
          <td>${user.loginname}</td>
          <td>${user.name}</td>
          <td><c:if test="${user.img!=''}">
          	<img src="${path}/file/${user.img}" width="100px;" alt="${user.name}" />
          </c:if></td>
          <td>${user.groupname}</td>
          <td>${user.lastlogintime}</td>
          <td>${user.loginip}</td>
          <td>${user.createtime}</td>
          <td>${user.zhuceip}</td>
          <td>
          <c:if test="${user.flag==0}">禁用</c:if>
          <c:if test="${user.flag==1}">正常</c:if>
          </td>
          <td><div class="button-group"> 
          <%-- 
          <a class="button border-main" href="${path}/admin/user/toupdateoradd.do?id=${user.id}"><span class="icon-edit"></span> 修改</a>
           --%>
           <c:if test="${user.flag==0}">
	          <a class="button border-main" href="javascript:void(0)" onclick="updateflag(${user.id},1)"><span class="icon-edit"></span> 启用</a>
          </c:if>
          <c:if test="${user.flag==1}">
	          <a class="button border-main" href="javascript:void(0)" onclick="updateflag(${user.id},0)"><span class="icon-lock"></span> 禁用</a>
          </c:if>
          
          <c:if test="${user.groupid==1}">
	          <a class="button border-main" href="javascript:void(0)" onclick="updategroup(${user.id},3)"><span class="icon-edit"></span> 取消管理员</a>
          </c:if>
          <c:if test="${user.groupid!=1}">
	          <a class="button border-main" href="javascript:void(0)" onclick="updategroup(${user.id},1)"><span class="icon-edit"></span> 设置管理员</a>
          </c:if>
          
          <a class="button border-main" href="javascript:void(0)" onclick="updatepwd(${user.id})"><span class="icon-edit"></span> 重置密码</a>
          <a class="button border-red" href="javascript:void(0)" onclick="del(${user.id})"><span class="icon-trash-o"></span> 删除</a> </div></td>
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
			url :'${path}/admin/user/del.do',
			data : param,
			dataType : 'json',
			success : function(datas) {
				if(datas==1){
					alert("删除成功");
					window.location.href='${path}/admin/user/index.do';
				}else{
					alert("删除失败");
				}
			}
		});
	}
}
function updatepwd(id){
	if(confirm("您确定要重置密码吗?")){
		var param = {};
		param.id=id;
		$.ajax({
			type : "post",
			url :'${path}/admin/user/updatepwd.do',
			data : param,
			dataType : 'json',
			success : function(datas) {
				if(datas==1){
					alert("重置密码成功,新密码为123456!");
					window.location.href='${path}/admin/user/index.do';
				}else{
					alert("删除失败");
				}
			}
		});
	}
}
function updateflag(id,flag){
		var param = {};
		param.id=id;
		param.flag=flag;
		$.ajax({
			type : "post",
			url :'${path}/admin/user/updateflag.do',
			data : param,
			dataType : 'json',
			success : function(datas) {
				if(datas==1){
					//alert("操作成功");
					window.location.href='${path}/admin/user/index.do';
				}else{
					alert("删除失败");
				}
			}
		});
}
function updategroup(id,groupid){
		var param = {};
		param.id=id;
		param.groupid=groupid;
		$.ajax({
			type : "post",
			url :'${path}/admin/user/updategroup.do',
			data : param,
			dataType : 'json',
			success : function(datas) {
				if(datas==1){
					window.location.href='${path}/admin/user/index.do';
				}else{
					alert("删除失败");
				}
			}
		});
}

function gotopage(url){
	window.location.href=url;
}

function submitform(){
	$("#form").submit();
}
</script>
</body></html>