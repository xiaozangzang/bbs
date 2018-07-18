<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  
<title>${user.name}的个人资料--${applicationScope.bbsinfo.name}</title>
 <meta name="keywords" content="${user.loginname}的个人资料" /> 
  <meta name="description" content="${user.loginname}的个人资料" /> 
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
     <li class="a"><a href="${path}/member/${user.id}_1.html">个人资料</a></li> 
     <li><a href="${path}/member/${user.id}_2.html">帖子</a></li> 
     <li><a href="${path}/member/${user.id}_3.html">留言板</a></li> 
    </ul> 
   </div>
   <div id="ct" class="ct1 wp cl"> 
    <div class="mn"> 
     <div class="bm bw0"> 
      <div class="bm_c"> 
       <div class="u_profile qing_u_profile"> 
        <table width="100%"> 
         <tbody>
          <tr> 
           <td class="qleft"> 基本概况 </td> 
           <td> 
           <h2 class="mbn"> ${user.loginname} <span class="xw0">(UID: ${user.id} )</span> </h2> 
           <h2 class="mbn"> 真实姓名 <span class="xw0">(${user.name} )</span> </h2> 
            </td> 
          </tr> 
          <tr> 
           <td class="qleft">统计信息</td> 
           <td> 
           <a href="javascript:;" target="_blank">帖子数： ${ziliao.tiezicount}</a> <span class="pipe">|</span> 
           <a href="javascript:;" target="_blank">回帖数： ${ziliao.huifucount}</a> <span class="pipe">|</span> 
           <a href="javascript:;" target="_blank">积分： ${user.jifen}</a> <span class="pipe">|</span> 
           </td> 
          </tr> 
          <tr> 
           <td class="qleft">个人资料</td> 
           <td> 
            <ul class="pf_l cl"> 
             <li><em>性别：</em>
             <c:if test="${user.sex==1}">
            	 男
             </c:if>
             <c:if test="${user.sex==2}">
            	 女
             </c:if>
             <c:if test="${user.sex==0}">
            	 保密
             </c:if>
             
             </li> 
             <li><em>生日：</em>${user.birthday}</li> 
            </ul> </td> 
          </tr> 
          <tr> 
           <td class="qleft">活跃概况</td> 
           <td> 
            <ul> 
           <!--  <li><em class="xg1">管理组&nbsp;&nbsp;</em><span style="color:#00CC00"><a href="javascript:;" ><font color="#00CC00">${ziliao.groupname}</font></a></span> </li> --> 
             <li><em class="xg1">用户等级&nbsp;&nbsp;</em><span style="color:#00CC00"><a href="javascript:;" ><font color="#00CC00">${ziliao.usergroupname}</font></a></span> </li> 
            </ul> 
            <ul id="pbbs" class="pf_l"> 
             <li><em>在线时间:</em>${ziliao.onlinetime}小时</li> 
             <li><em>注册时间:</em>${user.createtime}</li> 
             <li><em>最后登陆:</em>${user.lastlogintime}</li> 
            </ul> </td> 
          </tr> 
         </tbody>
        </table> 
       </div>
      </div> 
     </div> 
    </div> 
   </div> 
   <div class="wp mtn"> 
    <div id="diy3" class="area"></div>
   </div> 
  </div> 
 <br/>
<%@ include file="/WEB-INF/inc/foot.jsp"%>
 </body>
</html>