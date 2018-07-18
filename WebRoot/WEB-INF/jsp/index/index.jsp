<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head> 
  <title>${applicationScope.bbsinfo.indextitle}-${applicationScope.bbsinfo.name} </title> 
  <meta name="keywords" content="${applicationScope.bbsinfo.keywords}" /> 
  <meta name="baidu-site-verification" content="fDCbkFFyje" />
  <meta name="description" content="${applicationScope.bbsinfo.description} " /> 
  <link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_common.css" /> 
  <link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_forum_index.css" /> 
  <script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script> 
 </head> 
 <body id="nv_forum" class="pg_index">

 <%@ include file="/WEB-INF/inc/top.jsp"%>
 
  <div id="wp" class="wp"></div> 
  <div class="qing_bbs_topw cl"> 
   <div class="wp cl"> 
    <div class="cl"> 
     <div id="category_grid" class="cl"> 
      <table cellspacing="0" cellpadding="0">
       <tbody>
        <tr> 
         <td valign="top" class="category_l1"> 
          <div class="newimgbox"> 
           <div class="module cl slidebox_grid"> 
            <script type="text/javascript">
					var slideSpeed = 4000;
					var slideImgsize = [260,200];
					var slideBorderColor = '#C2D5E3';
					var slideBgColor = '#FFFFFF';
					var slideImgs = new Array();
					var slideImgLinks = new Array();
					var slideImgTexts = new Array();
					var slideSwitchColor = '#555';
					var slideSwitchbgColor = '#FFFFFF';
					var slideSwitchHiColor = '#C2D5E3';
					slideImgs[1] = 'css/img/jianda/1.jpg';
					slideImgLinks[1] = '${path}';
					slideImgTexts[1] = '怪蜀黍，在哪，嘻嘻';
					slideImgs[2] = 'css/img/jianda/2.jpg';
					slideImgLinks[2] = '${path}';
					slideImgTexts[2] = '今天我不美吗？给个粉呗';
					slideImgs[3] = 'css/img/jianda/3.jpg';
					slideImgLinks[3] = '${path}';
					slideImgTexts[3] = '无需root，emui3.1添加状态栏沉浸的教程';
					slideImgs[4] = 'css/img/jianda/4.jpg';
					slideImgLinks[4] = '${path}';
					slideImgTexts[4] = '虽然是我一个人，但是我依然过的很好！ ...';
					slideImgs[5] = 'css/img/jianda/5.jpg';
					slideImgLinks[5] = '${path}';
					slideImgTexts[5] = '找个男朋友过冬 哈哈~~';
			</script> 
            <script src="${path}/public/js/index/forum_slide.js" type="text/javascript"></script> 
           </div> 
          </div> </td> 
         <td valign="top" class="category_l2"> 
          <div class="subjectbox"> 
           <h2>最新帖子</h2> 
           <ul class="category_newlist"> 
           <c:set var="xcount" value="0" />
           <c:forEach items="${ztiezi}" var="tiezi">
           	<c:if test="${tiezi.flag==1}">
           		<c:set var="xcount" value="${xcount+1}"/>
	            <li class="list_${xcount}"><span>${xcount}</span><a href="${path}/tiezi/${tiezi.id}_1_1.html" title="${tiezi.name}" target="_blank">${tiezi.name}</a></li> 
           	</c:if>
           </c:forEach>
           </ul> 
          </div> </td> 
         <td valign="top" class="category_l3"> 
          <div class="replaybox"> 
           <h2 style="color:#1366CB;">最新回复</h2> 
           <ul class="category_newlist"> 
            <c:set var="xcount" value="0" />
           <c:forEach items="${ztiezi}" var="tiezi">
           	<c:if test="${tiezi.flag==2}">
           		<c:set var="xcount" value="${xcount+1}"/>
	            <li class="list_${xcount}"><span>${xcount}</span><a href="${path}/tiezi/${tiezi.id}_1_1.html" title="${tiezi.name}" target="_blank">${tiezi.name}</a></li> 
           	</c:if>
           </c:forEach>
           </ul>
          </div> </td> 
         <td valign="top" class="category_l3" style="background:none;"> 
          <div class="hottiebox"> 
           <h2 style="color:#AE730D;">热帖</h2> 
           <ul class="category_newlist"> 
           	<c:set var="xcount" value="0" />
           <c:forEach items="${ztiezi}" var="tiezi">
           	<c:if test="${tiezi.flag==3}">
           		<c:set var="xcount" value="${xcount+1}"/>
	            <li class="list_${xcount}"><span>${xcount}</span><a href="${path}/tiezi/${tiezi.id}_1_1.html" title="${tiezi.name}" target="_blank">${tiezi.name}</a></li> 
           	</c:if>
           </c:forEach>
            </ul> 
          </div> </td> 
        </tr>
       </tbody>
      </table> 
     </div> 
    </div> 
   </div> 
   <!-- index four grid end --> 
  </div> 
  <div id="wp" class="wp"> 
   <div class="cl"> 
    <div class="y" style="max-width:560px; overflow:hidden;"> 
     <div id="an"> 
      <dl class="cl"> 
       <dt class="z xw1">
      		  公告:&nbsp;
       </dt> 
       <dd> 
        <div id="anc" >
         <p class="chart z">
          	管理员公告：<em>${gonggao.content }</em>
         </p> 
        </div> 
       </dd> 
      </dl> 
     </div> 
    </div>
    <div class="z"> 
     <div id="chart"> 
      <p class="chart z">
      	今日: <em>${indexmap.tttiezi}</em><span class="pipe">|</span>
      	昨日: <em>${indexmap.zttiezi}</em><span class="pipe">|</span>
      	帖子: <em>${indexmap.ztiezi}</em><span class="pipe">|</span>
      	会员: <em>${indexmap.zuser}</em><span class="pipe">|</span>
      	欢迎新会员: <em><a href="${path}/member/${indexmap.userid}_1.html" target="_blank" class="xi2">${indexmap.username}</a></em>
      </p> 
     </div> 
    </div> 
    <div class="z"></div> 
   </div> 
   <div id="diy_chart" class="area"></div>
   <div class="wp"> 
    <div id="diy1" class="area"></div>
   </div> 
   <div id="ct" class="wp cl"> 
    <div class="mn"> 
     <div class="fl bm"> 
     
     <c:forEach items="${bankuailist}" var="pbankuai">
     <c:if test="${pbankuai.parentId==0}">
      <div class="bm bmw cl"> 
       <div class="bm_h cl"> 
        <h2><a href="${path}/${pbankuai.id}.html" style="">${pbankuai.name}</a><!-- <span>( 分区版主: <a href="" class="notabs" c="1">妖精的眼泪</a> )</span> --></h2> 
       </div> 
       <div id="category_1" style=""> 
        <table cellspacing="0" cellpadding="0" class="fl_tb"> 
         <tbody>
         
         <c:forEach items="${bankuailist}" var="zbankuai">
         <c:if test="${zbankuai.parentId==pbankuai.id}">
          <tr class="fl_row"> 
           <td class="fl_icn"> <a href="${path}/bk/${zbankuai.id}_1_0_0.html"><img src="${path}/file/${zbankuai.img}" align="left" alt="${zbankuai.name}" /></a></td> 
           <td> <h2><a href="${path}/bk/${zbankuai.id}_1_0_0.html">${zbankuai.name}</a></h2> <p class="xg2">${zbankuai.descs}</p> </td> 
           <td class="fl_i"> <span>${zbankuai.zhuticount}</span><p>帖数</p> </td> 
           <td class="fl_i"> <span>${zbankuai.huifucount}</span><p>回复</p> </td> 
           <td class="fl_by"> 
            <div> 
             <cite><a href="${path}/member/${zbankuai.userid}_1_1.html">${zbankuai.username }</a> ${zbankuai.tiezicreateTime }</cite>
             <a href="${path}/tiezi/${zbankuai.tieziid}_1_1.html" class="xi2">${zbankuai.tieziname }</a> 
            </div> </td> 
          </tr> 
          </c:if>
          </c:forEach>
         </tbody>
        </table> 
       </div> 
      </div>
      </c:if>
    </c:forEach>
     
     </div> 
    </div> 
   </div> 
  </div> 
  <div class="qing_lk cl"> 
   <div id="category_lk" class="wp ptm"> 
    <ul class="x cl"> 
    <c:forEach items="${linklist}" var="link">
     <li><a href="${link.link}" target="_blank" title="${link.name}">${link.name}</a></li>
    </c:forEach>
    </ul> 
   </div> 
  </div> 

<%@ include file="/WEB-INF/inc/foot.jsp"%>

 </body>
</html>