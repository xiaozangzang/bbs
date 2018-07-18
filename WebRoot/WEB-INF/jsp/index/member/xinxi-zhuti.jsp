<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  
<title>${user.name}的发布--${applicationScope.bbsinfo.name}</title>
 <meta name="keywords" content="${user.loginname}的帖子" /> 
  <meta name="description" content="${user.loginname}的帖子" /> 
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_common.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_home_space.css" /> 
<script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
</head>
 <body id="nv_forum" class="pg_index">

 <%@ include file="/WEB-INF/inc/top.jsp"%>
 <%@ include file="/WEB-INF/jsp/index/member/xinxi-top.jsp"%>
 
  <div id="wp" class="wp"> 
   <div class="qing_space_tb cl"> 
    <ul class="tb cl"> 
     <li><a href="${path}/member/${user.id}_1.html">个人资料</a></li> 
     <li class="a"><a href="${path}/member/${user.id}_2.html">帖子</a></li> 
     <li><a href="${path}/member/${user.id}_3.html">留言板</a></li> 
    </ul> 
   </div>
   
   
  <div id="ct" class="ct1 wp cl"> 
   <div > 
    <div class="bm bw0"> 
     <div class="bm_c"> 
     <!--  <p class="tbmu"> <a href="" class="a">主题</a> <span class="pipe">|</span> <a href="">回复</a> </p>  -->
      <div class="tl"> 
       <form method="post"  action="" onsubmit="showDialog('确定要删除选中的主题吗？', 'confirm', '', '$(\'delform\').submit();'); return false;"> 
        <table cellspacing="0" cellpadding="0"> 
         <tbody>
          <tr class="th"> 
           <td class="icn">&nbsp;</td> 
           <th>发帖名称</th> 
           <td class="frm">论坛名称</td> 
           <td class="num">回复/查看</td> 
           <td class="by"><cite>最新回复</cite></td> 
          </tr> 
          <c:forEach items="${tiezipage.list}" var="tiezi">
	          <tr> 
	           <td class="icn"><a href="" title="新窗口打开" target="_blank"> <img src="${path}/static/image/common/pin_3.gif" alt="全局置顶" /> </a> </td> 
	           <th> <a href="${path}/tiezi/${tiezi.id}_1_1.html" target="_blank">${tiezi.name}</a></th> 
	           <td> <a href="${path}/bk/${tiezi.bankuaiId}_1_0_0.html" class="xg1" target="_blank">${tiezi.bankuainame }</a> </td> 
	           <td > <em>${tiezi.huifucount}</em> /<em>${tiezi.findcount}</em> </td> 
	           <td class="by"> <a href="${path}/member/${tiezi.huifuuserid}_1.html" target="_blank">${tiezi.huifuusername}</a>/ <em>${tiezi.huifucreatetime}</em> </td> 
	          </tr> 
          </c:forEach>
         </tbody>
        </table> 
       </form> 
      </div> 
     </div> 
    </div> 
       <div class="bm bw0 pgs cl"> 
        <div class="pg">
        <c:if test="${tiezipage.pagestart!=1}">
        <a href="${path}/member/${user.id}_2_${tiezipage.pagestart-1}.html" class="prev"></a>
        </c:if>
         <strong>${tiezipage.pagestart}</strong>
         <c:if test="${tiezipage.pagestart!=tiezipage.totalPages}">
         <a href="${path}/member/${user.id}_2_${tiezipage.pagestart+1}.html" class="nxt"></a>
         </c:if>
        </div>
      </div>
   </div> 
  </div>
  </div> 
<%@ include file="/WEB-INF/inc/foot.jsp"%>
 </body>
</html>