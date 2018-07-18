<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <title>${bankuai.name}-${applicationScope.bbsinfo.name} </title> 
  <meta name="keywords" content="${bankuai.name}" /> 
  <meta name="description" content="${bankuai.descs}" /> 
  <link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_common.css" />
  <link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_forum_forumdisplay.css" /> 
  <script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
</head>
 <body id="nv_forum" class="pg_index">
 <%@ include file="/WEB-INF/inc/top.jsp"%>
   <div id="wp" class="wp"></div> 
  <div class="qing_forum_thumb cl" style="background:url(${path}/css/img/banner/common_2_banner.jpg) no-repeat center top;"> 
   <div class="wp cl"> 
    <div id="pt" class="cl"> 
     <div class="z"> 
      <a href="${path}/" class="nvhm" title="首页">首页</a> 
      	<em>›</em> 
     	<a href="${path}/${bankuai.fid}.html">${bankuai.fname}</a>
      	<em>›</em> 
     	<a href="${path}/bk/${bankuai.id}_1_0_0.html">${bankuai.name}</a>
      <span class="qing_ptpip">今日: ${nowcount} , 总数: ${page.totalRecords}</span> 
     </div> 
    </div> 
    <div class="qing_forum_second cl"> 
     <a href="${path}/tz/toft.do?id=${bankuaiid}" class="pn pnc poster z">发新帖</a> 
     <ul id="thread_types" class="qttp y cl"> 
      <li <c:if test="${zhutiid==0}">class="xw1 a"</c:if>  ><a href="${path}/bk/${bankuaiid}_1_0_${orderby}.html">全部<span></span></a></li> 
      <c:forEach items="${zhutilist}" var="zhuti">
	      <li <c:if test="${zhutiid==zhuti.id}">class="xw1 a"</c:if> ><a href="${path}/bk/${bankuaiid}_1_${zhuti.id}_${orderby}.html">${zhuti.name}<span></span></a></li> 
      </c:forEach>
     </ul> 
    </div> 
   </div> 
  </div> 
  <div id="wp" class="wp"> 
   <div class="boardnav"> 
    <div id="ct" class="wp cl"> 
     <div class="mn"> 
      <div id="threadlist" class="tl qing_threadlist bm"> 
       <div class="th q_th"> 
        <table cellspacing="0" cellpadding="0"> 
         <tbody>
          <tr> 
           <th colspan="2"> 
            <div class="tf"> 
             <div class="z"> 
              <a href="${path}/bk/${bankuaiid}_1_${zhutiid}_0.html" class=""><i class="newthead"></i>最新</a>&nbsp; 
              <a href="${path}/bk/${bankuaiid}_1_${zhutiid}_1.html" class=""><i class="lastthead"></i>最后发表</a>&nbsp; 
              <a href="${path}/bk/${bankuaiid}_1_${zhutiid}_2.html" class=""><i class="verythead"></i>精华</a>&nbsp; 
             </div> 
            </div> </th> 
          </tr> 
         </tbody>
        </table> 
       </div> 
       <div class="cl qing_simplelist"> 
        <div id="forumnew" style="display:none"></div> 
        <form method="post"  name="moderate" id="moderate" action=""> 
         <table summary="forum_2" cellspacing="0" cellpadding="0" id="threadlisttableid"> 
          <tbody > 
          <c:forEach items="${zhidinglist}" var="zhiding">
	           <tr> 
	            <td class="icn"> <a href="" class="avatar"><img src="${path}/file/${zhiding.tieziuserimg}" /></a> </td> 
	            <th class="common"> 
	             <div class="q_f_title1"> 
	              <div class="z qing_fenlei"> 
	              </div> 
	              <a href="${path}/tiezi/${zhiding.id}_1_1.html"  class="s xst">${zhiding.name}</a> 
	              <c:if test="${not empty zhiding.jinghua}">
	               <img src="${path}/css/img/icon/j${zhiding.jinghua}.png" alt="digest" title="精华 ${zhiding.jinghua}" /> 
              	  </c:if>
	             </div> <p></p> 
	             <div class="q_f_title2"> 
	              <div class="z"> 
	               <a href="${path}/member/${zhiding.tieziuserid}_1.html" style="color: #CC3333;">admin</a> 发表于 
	               <span> ${zhiding.createtime}</span> 
	               <span style="margin-left:10px;">
	               <c:if test="${zhiding.zhiding==2}">
	               	全局置顶
	               </c:if>
	               <c:if test="${zhiding.zhiding==1}">
	               	板块置顶
	               </c:if>
	               </span> 
	              </div> 
	             </div></th> 
	            <td class="num"><a>${zhiding.findcount}</a><em>查看</em></td> 
	            <td class="num"><a href="" class="xi2">${zhiding.huifucount}</a><em>回复</em></td> 
	            <td class="by"> 
	             <div class="byleft"> 
	              <cite><a href="${path}/member/${zhiding.huifuuserid}_1.html">${zhiding.huifuusername}</a> <em>${zhiding.huifucreatetime}</em></cite> 
	             </div> </td> 
	           </tr> 
          
          </c:forEach>
          </tbody> 
          <tbody id="separatorline"> 
           <tr class="ts"> 
            <th colspan="5">
             <div class="separatorlinediv cl">
              <a href="javascript:;" title="查看更新" class="forumrefresh">已发布帖子</a>
             </div></th> 
           </tr> 
          </tbody> 
          <tbody id="normalthread_14"> 
          <c:forEach items="${page.list}" var="tiezi">
           <tr> 
            <td class="icn"> <a href="${path}/member/${tiezi.tieziuserid}_1.html" class="avatar"><img src="${path}/file/${tiezi.tieziuserimg}" /></a> </td> 
            <th class="common"> 
             <div class="q_f_title1"> 
              <div class="z qing_fenlei">
               <em>[<a href="${path}/tiezi/${tiezi.id}_1_1.html">${tiezi.zhutiname}</a>]</em> 
              </div> 
              <a href="${path}/tiezi/${tiezi.id}_1_1.html"  class="s xst">${tiezi.name}</a> 
              <c:if test="${not empty tiezi.jinghua}">
	               <img src="${path}/css/img/icon/j${tiezi.jinghua}.png" alt="digest" title="精华 ${tiezi.jinghua}" /> 
              </c:if>
             </div> <p></p> 
             <div class="q_f_title2"> 
              <div class="z"> 
               <a href="${path}/member/${tiezi.tieziuserid}_1.html">${tiezi.tieziusername}</a> 发表于 
               <span> ${tiezi.createtime}</span> 
              </div> 
             </div></th> 
            <td class="num"><a>${tiezi.findcount}</a><em>查看</em></td> 
            <td class="num"><a href="" class="xi2">${tiezi.huifucount}</a><em>回复</em></td> 
            <td class="by"> 
             <div class="byleft"> 
              <cite><a href="${path}/member/${tiezi.huifuuserid}_1.html">${tiezi.huifuusername}</a> <em>${tiezi.huifucreatetime}</em></cite> 
             </div> </td> 
           </tr> 
           </c:forEach>
          </tbody> 
         </table>
        </form> 
       </div> 
       <c:if test="${page.pagestart!=page.totalPages}">
       <a href="${path}/bk/${bankuaiid}_${page.pagestart+1}_${zhutiid}_${orderby}.html"   id="autopbn" >下一页 &raquo;</a> 
       </c:if>
      </div> 
      <div class="bm bw0 pgs cl"> 
        <div class="pg">
        <c:if test="${page.pagestart!=1}">
        <a href="${path}/bk/${bankuaiid}_${page.pagestart-1}_${zhutiid}_${orderby}.html" class="prev"></a>
        </c:if>
         <strong>${page.pagestart}</strong>
         <c:if test="${page.pagestart!=page.totalPages}">
         <a href="${path}/bk/${bankuaiid}_${page.pagestart+1}_${zhutiid}_${orderby}.html" class="nxt"></a>
         </c:if>
        </div>
      </div>
     </div> 
    </div> 
   </div> 
  </div> 
<%@ include file="/WEB-INF/inc/foot.jsp"%>

 </body>
</html>