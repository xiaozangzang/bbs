<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
   <div class="pagelist"> 
   <c:if test="${page.pagestart!=1}">
	   <a href="javascript:;" onclick="topage(1)">首页</a> 
	   <a href="javascript:;" onclick="topage(${page.pagestart-1})">上一页</a> 
   </c:if>
   
	   <span class="current">${page.pagestart}</span>
	   <c:if test="${page.pagestart!=page.totalPages}">
		   <a href="javascript:;" onclick="topage(${page.pagestart+1})">下一页</a>
		   <a href="javascript:;" onclick="topage(${page.totalPages})">尾页</a> 
	   </c:if>
   </div>
   <script type="text/javascript">
   function topage(pageno){
	   $("form").each(function(){
		  $(this).append('<input type="hidden" name="pagestart" value="'+pageno+'" />');
		  $(this).submit();
	   });
	   
   }
   
   </script>