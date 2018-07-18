<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  
<title>积分记录</title>
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_common.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_home_spacecp.css" /> 
<link rel="stylesheet" href="${path }/admin/css/admin.css"/>
<script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="${path}/public/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
 <body id="nv_forum" class="pg_index">
 <%@ include file="/WEB-INF/inc/top.jsp"%>

  <div id="wp" class="wp">
   <div id="pt" class="bm cl"> 
    <div class="z"> 
     <a href="${path}/" class="nvhm" title="首页">首页</a> 
     <em>›</em> 
     <a href="${path}/user/index.do">设置</a> 
     <em>›</em><a href="${path}/user/jifen/index.do">积分</a>
     <em>›</em><a href="${path}/user/jifen/index.do">积分记录</a> 
    </div> 
   </div> 
   <div id="ct" class="ct2_a wp cl"> 
    <div class="mn"> 
     <div class="bm bw0"> 
      <h1 class="mt">积分 </h1> 
      <ul class="tb cl"> 
       <li class="a"><a href="${path}/user/jifen/index.do">积分记录</a></li> 
       <li><a href="${path}/user/jifen/record.do">积分规则</a></li> 
      </ul>
      <form method="post" action="${path}/user/jifen/index.do"> 
       <div><span>您的总积分为：${sessionScope.indexuser.jifen}</span></div>
       <div class="exfm" style="margin-top: 10;"> 
        <table cellspacing="0" cellpadding="0"> 
         <tbody>
         <tr>
         </tr>
          <tr> 
           <th>时间范围:</th> 
           <td> 
             <input type="text" name="starttime" value="${jifen.starttime}"  onfocus="WdatePicker({skin:'YcloudRed',dateFmt:'yyyy-MM-dd'})"  class="Wdate"   readonly="readonly" />
            	至
             <input type="text" name="endtime" value="${jifen.endtime}" onfocus="WdatePicker({skin:'YcloudRed',dateFmt:'yyyy-MM-dd'})"  class="Wdate"  readonly="readonly"  /> </td> 
           <th>操作:</th> 
           <td><span class="ftid">
           <select name="type" class="ps" >
           <option value="">请选择</option>
           <option value="101" <c:if test="${jifen.type==101}">selected="selected"</c:if> >发帖</option>
           <option value="102" <c:if test="${jifen.type==102}">selected="selected"</c:if> >回复</option>
           <option value="103" <c:if test="${jifen.type==103}">selected="selected"</c:if> >精华</option>
           <option value="104" <c:if test="${jifen.type==104}">selected="selected"</c:if> >登录</option>
           </select>
           </span></td> 
          </tr> 
          <tr> 
           <th>&nbsp;</th> 
           <td><button type="submit" class="pn"><strong>查询</strong></button></td> 
          </tr> 
         </tbody>
        </table> 
       </div> 
       <table cellspacing="0" cellpadding="0" class="dt"> 
        <tbody>
         <tr> 
          <th width="10%">操作</th> 
          <th width="10%">积分变更</th> 
          <th width="60%">详情</th> 
          <th width="20%">操作时间</th> 
         </tr>
         <c:forEach items="${page.list}" var="jifen">
         <tr> 
          <td>
          <c:if test="${jifen.type==101}">
          	发帖
          </c:if>
          <c:if test="${jifen.type==102}">
          	回复
          </c:if>
          <c:if test="${jifen.type==103}">
          	精华
          </c:if>
          <c:if test="${jifen.type==104}">
          	登录
          </c:if>
          </td> 
          <td>
          <c:if test="${jifen.fenshu>0}">
	          +<span class="xg1">${jifen.fenshu}</span>
          </c:if>
          <c:if test="${jifen.fenshu<0}">
	         - <span class="xg1">${jifen.fenshu}</span>
          </c:if>
          </td> 
          <td>${jifen.content}</td> 
          <td>${jifen.createtime}</td> 
         </tr> 
         </c:forEach>
         <tr>
        <td colspan="8">
			<jsp:include page="/WEB-INF/inc/page.jsp" flush="true"/>		
		</td>
      </tr>
        </tbody>
       </table> 
      </form> 
     </div> 
    </div> 
    <div class="appl">
     <div class="tbn"> 
      <h2 class="mt bbda">设置</h2> 
      <ul> 
       <li><a href="${path}/user/index.do">个人资料</a></li> 
       <li><a href="${path}/user/topwd.do">密码安全</a></li> 
       <li class="a"><a href="${path}/user/jifen/index.do">积分</a></li>  
      </ul> 
     </div>
    </div> 
   </div> 
  </div>


<%@ include file="/WEB-INF/inc/foot.jsp"%>
 </body>
</html>