<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>${map.tiezi.name}-${applicationScope.bbsinfo.name}</title>
<meta name="keywords" content="${map.tiezi.name}" /> 
<meta name="description" content="${map.tiezi.contenttxt}" /> 
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_common.css" />
<link rel="stylesheet" type="text/css" href="${path}/public/css/tubiao.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_forum_viewthread.css" /> 
<script type="text/javascript" src="${path}/public/js/jquery-1.8.2.min.js" ></script>
 <script type="text/javascript" charset="utf-8" src="${path}/public/baiduueditor/ueditor.config.huifu.js"></script>
 <script type="text/javascript" charset="utf-8" src="${path}/public/baiduueditor/ueditor.all.min.js"></script>
 <script type="text/javascript" src="${path}/public/baiduueditor/lang/zh-cn/zh-cn.js"></script>
 <script type="text/javascript" src="${path}/public/layer/layer.js"></script>
<script type="text/javascript">
$(function(){
	  UE.getEditor('myEditor');
	  window.setTimeout(updatefindcount, 2000);
 });
 
function geteditorhtml(){
	 var editorhtml=UE.getEditor('myEditor').getContent();
	 var editortxt=UE.getEditor('myEditor').getContentTxt();
	 if(editorhtml==""){
		 alert("请输入内容");
		 UE.getEditor('myEditor').focus();
		 return;
	 }
	 var param={};
	 param.editorhtml=editorhtml;
	 param.editortxt=editortxt;
	 param.id=${map.tiezi.id};
	 $.ajax({
		   type: "POST",
		   url: "${path}/tz/addhuifu.do",
		   data: param,
		   dataType: "json", 
		   async: false,
		   success: function(data){
			   if(data==1){
				   window.location.href="${path}/tiezi/${map.tiezi.id}_1_1.html";					   
			   }else if(data==0){
				   alert("该板块不允许发表回复");
			   }else{
				   alert("系统错误");
			   }
		   }
	 });
}

function gotologin(){
	window.location.href="${path}/login/index.do?pathlocation=${path}/tiezi/${map.tiezi.id}_1_1.html";
}


function updatefindcount(){
	var param={};
	 param.id=${map.tiezi.id};
	 $.ajax({
		   type: "POST",
		   url: "${path}/tiezi/updatefindcount.do",
		   data: param,
		   dataType: "json", 
		   async: false,
		   success: function(data){
		   }
	 });
}

function tzczshoworhide(id){
	var e = window.event;
    var scrollX = document.documentElement.scrollLeft || document.body.scrollLeft;
    var scrollY = document.documentElement.scrollTop || document.body.scrollTop;
    var x = e.pageX || e.clientX + scrollX;
    var y = e.pageY || e.clientY + scrollY;
    $("#"+id).css("left",x);	
    $("#"+id).css("top",y+15);
	$("#"+id).slideToggle('fast');	
}
//设置精华
function szjh(tieziid,jh){
	var param={};
	 param.id=tieziid;
	 param.jinghua=jh;
	 $.ajax({
		   type: "POST",
		   url: "${path}/moderator/common/shezhijinghua.do",
		   data: param,
		   dataType: "json", 
		   async: false,
		   success: function(data){
			   window.location.reload();
		   }
	 });
}
//取消精华
function qxszjh(tieziid){
	var param={};
	 param.id=tieziid;
	 $.ajax({
		   type: "POST",
		   url: "${path}/moderator/common/qxshezhijinghua.do",
		   data: param,
		   dataType: "json", 
		   async: false,
		   success: function(data){
			   window.location.reload();
		   }
	 });
}
//全局置顶
function qjzd(tieziid){
	var param={};
	 param.id=tieziid;
	 $.ajax({
		   type: "POST",
		   url: "${path}/admin/common/updateallzhiding.do",
		   data: param,
		   dataType: "json", 
		   async: false,
		   success: function(data){
			   window.location.reload();
		   }
	 });
}
//取消置顶
function qxqjzd(tieziid){
	var param={};
	 param.id=tieziid;
	 $.ajax({
		   type: "POST",
		   url: "${path}/admin/common/updateallqxzhiding.do",
		   data: param,
		   dataType: "json", 
		   async: false,
		   success: function(data){
			   window.location.reload();
		   }
	 });
}

function bkzd(tieziid){
	var param={};
	 param.id=tieziid;
	 $.ajax({
		   type: "POST",
		   url: "${path}/moderator/common/updatebankuaizhiding.do",
		   data: param,
		   dataType: "json", 
		   async: false,
		   success: function(data){
			   window.location.reload();
		   }
	 });
}
function qxbkzd(tieziid){
	var param={};
	 param.id=tieziid;
	 $.ajax({
		   type: "POST",
		   url: "${path}/moderator/common/updatebankuaiqxzhiding.do",
		   data: param,
		   dataType: "json", 
		   async: false,
		   success: function(data){
			   window.location.reload();
		   }
	 });
}

function deltiezi(tieziid){
	if(confirm("确认删除此帖子吗?删除此贴将导致此贴所有回复消失")){
		var param={};
		 param.id=tieziid;
		 $.ajax({
			   type: "POST",
			   url: "${path}/moderator/common/deltiezi.do",
			   data: param,
			   dataType: "json", 
			   async: false,
			   success: function(data){
				   window.location.href='${path}/bk/${map.tiezi.zbankuaiid}_1_0_0.html';
			   }
		 });
	}
}
function updatetiezi(tieziid){
		window.location.href='${path}/tz/toupdate.do?tieziid='+tieziid;
}
function delhuifu(huifuid){
	if(confirm("确认删除此回复吗?")){
		var param={};
		 param.id=huifuid;
		 $.ajax({
			   type: "POST",
			   url: "${path}/moderator/common/delhuifu.do",
			   data: param,
			   dataType: "json", 
			   success: function(data){
				   window.location.reload();
			   }
		 });
	}
}

function addhuifu(huifuid){
	var id='${map.tiezi.id}';
	layer.open({
		  type: 2,
		  title: '发表回复',
		  shadeClose: true,
		  shade: 0.8,
		  area: ['903px', '358px'],
		  content: '${path}/tz/toaddhuifu.do?id='+ id+'&huifuid='+huifuid
		}); 
}

function yidongztree(){
	var id='${map.tiezi.id}';
	layer.open({
		  type: 2,
		  title: '移动板块',
		  shadeClose: true,
		  shade: 0.8,
		  area: ['303px', '358px'],
		  content: '${path}/moderator/common/ztreeyidong.do?id='+id
		}); 
}
</script>
</head>
 <body id="nv_forum" class="pg_index">

 <%@ include file="/WEB-INF/inc/top.jsp"%>
 
   <div id="wp" class="wp">
   <div id="diynavtop" class="area"></div>
   <div id="pt" class="bm cl"> 
    <div class="z"> 
     <a href="${path}/" class="nvhm" title="首页">首页</a>
     <em>›</em> 
     <a href="${path}/${map.tiezi.fbankuaiid}.html">${map.tiezi.fbankuainame}</a> 
     <em>›</em> 
     <a href="${path}/bk/${map.tiezi.zbankuaiid}_1_0_0.html">${map.tiezi.zbankuainame}</a> 
     <em>›</em> 
     <a href="${path}/tiezi/${map.tiezi.id}_1_1.html">${map.tiezi.name}</a> 
    </div> 
    <div class="y"> 
     <a href="${path}/tz/toft.do?id=${map.tiezi.zbankuaiid}" id="newspecial" title="发新帖" class="qing_f_post">发新帖</a> 
     <a id="post_reply" onclick="" href="#fastposteditor" title="回复" class="qing_f_reply">回复</a> 
    </div> 
   </div> 
   <div class="wp"> 
    <div id="diy1" class="area"></div>
   </div> 
   <div id="ct" class="wp cl"> 
    <div id="postlist" class="pl"> 
     <table cellspacing="0" cellpadding="0" class="ad">
      <tbody>
       <tr>
        <td class="pls"></td>
        <td class="plc"></td>
       </tr>
      </tbody>
     </table>
     <div id="post_240">
      <table id="pid240" summary="pid240" cellspacing="0" cellpadding="0"> 
       <tbody>
        <tr> 
         <td class="pls"> 
          <div> 
           <div class="avatar" >
            <a href="${path}/member/${map.tiezi.userid}_1.html" target="_blank"><img src="${path}/file/${map.tiezi.userimg}" /></a>
           </div> 
           <div class="qing_pi"> 
            <div class="authi">
             <a href="${path}/member/${map.tiezi.userid}_1.html" target="_blank" class="xw1" <c:if test="${map.tiezi.groupid==1}">style="color: #cc0000"</c:if> >${map.tiezi.loginname}</a> 
            </div> 
           </div> 
           <div class="qing_v_card"> 
            <p><em <c:if test="${map.tiezi.groupid==1}">style="color: #cc0000"</c:if> >  ${map.tiezi.groupname}</em></p> 
             <div class="${map.tiezi.classname}"></div>
            <div class="qcard">
             <div class="tns xg2">
              <table cellspacing="0" cellpadding="0">
               <tbody>
                <tr>
                 <th><p><a href="${path}/member/${map.tiezi.userid}_2.html" class="xi2">${map.tiezi.tiezicount}</a></p>帖子</th>
                 <th><p><a href="" class="xi2">${map.tiezi.userhuifucount}</a></p>回复</th>
                 <td><p><a href="" class="xi2">${map.tiezi.jifen}</a></p>积分</td>
                </tr>
               </tbody>
              </table>
             </div>
            </div> 
            <p><span class="pbg2" ><span class="pbr2" style="width:36%;"></span></span></p> 
            <div id="g_up240_menu" class="tip tip_4" style="display: none;">
             <div class="tip_horn"></div>
             <div class="tip_c">
              演示组, 积分 372, 距离下一级还需 628 积分
             </div>
            </div> 
           </div>
          </div> </td> 
         <td id="plc_240" class="plc"> 
          <div class="mtm pbm bbda"> 
           <h1 class="ts"> <a href="${path}/tiezi/${map.tiezi.id}_1_1.html">[${map.tiezi.zhutiname}]</a> 
           <a href="${path}/tiezi/${map.tiezi.id}_1_1.html" id="thread_subject">${map.tiezi.name}</a> </h1> 
           <span class="xg1"> </span> 
          </div> 
          <div class="pi"> 
           <strong class="xg1"> <a href="javascript:;" title="楼主" >楼主</a> </strong> 
           <div class="pti"> 
            <div class="pdbt"> 
            </div> 
            <div class="authi xg1"> 
             <em id="authorposton240">发表于 ${map.tiezi.createtime}</em> 
             <span class="pipe">|</span> 查看: ${map.tiezi.findcount}
             <span class="pipe">|</span> 回复: ${map.tiezi.huifucount}
            </div> 
           </div> 
          </div>
          <div class="pct"> 
           <style type="text/css">.pcb{margin-right:0}</style>
           <div class="pcb"> 
            <div class="t_fsz"> 
             <table cellspacing="0" cellpadding="0">
              <tbody>
               <tr>
                <td class="t_f" style="overflow: hidden;"> 
                 <div align="left" >
                  ${map.tiezi.contenthtml}
                  
                  <div class="attach_nopermission">
<!-- 					<div>
					<h3>本帖子中包含更多资源</h3>
					<p>您需要 <a href="member.php?mod=logging&amp;action=login" onclick="showWindow('login', this.href);return false;">登录</a> 才可以下载或查看，没有帐号？<a href="member.php?mod=register" title="注册帐号">立即注册</a> </p>
					</div>
					</div> -->
                 </div><br /> 
                 </td>
               </tr>
              </tbody>
             </table> 
            </div> 
           </div>
          </div> 
          <!-- <table>
           <tbody>
            <tr>
             <td> 
              <div class="sign" style="max-height:100px;maxHeightIE:100px;">
               <a href="http://www.dzzsk.com/demo/simple/static/image/smiley/default/smile.gif" target="_blank">http://www.dzzsk.com/demo/simple/static/image/smiley/default/smile.gif</a>
              </div> </td>
            </tr>
           </tbody>
          </table>  -->
          <div id="po_240" class="po"> 
           <div class="pob cl">
				<p>
				<c:if test="${sessionScope.indexuser.groupid==1 or sessionScope.indexuser.groupid==2 or sessionScope.indexuser.id==map.tiezi.userid}">
					<a href="javascript:;" onclick="deltiezi(${map.tiezi.id})">删除帖子</a>
					<a href="javascript:;" onclick="updatetiezi(${map.tiezi.id})">编辑帖子</a>
           		</c:if>
				<c:if test="${sessionScope.indexuser.groupid==1 or sessionScope.indexuser.groupid==2 }">
				<a href="javascript:;"  class="showmenu" onclick="tzczshoworhide('tzcz')" >操作</a>
					<ul id="tzcz" class="p_pop mgcmn" style="position: absolute; z-index: 301; display: none;" >
						<li><a href="javascript:;" onclick="yidongztree();"><img src="${path}/static/image/magic/highlight.small.gif"/>移动板块</a></li>
					<c:if test="${sessionScope.indexuser.groupid==1}">
						<c:if test="${map.tiezi.zhiding!=2}">
							<li><a href="javascript:;" onclick="qjzd('${map.tiezi.id}');"><img src="${path}/static/image/magic/jack.small.gif"/>全局置顶</a></li>
						</c:if>
						<c:if test="${map.tiezi.zhiding==2}">
							<li><a href="javascript:;" onclick="qxqjzd('${map.tiezi.id}');"><img src="${path}/static/image/magic/jack.small.gif"/>取消全局</a></li>
						</c:if>
					</c:if>
					<c:if test="${map.tiezi.zhiding!=1}">
						<li><a href="javascript:;" onclick="bkzd('${map.tiezi.id}');"><img src="${path}/static/image/magic/stick.small.gif"/>板块置顶</a></li>
					</c:if>
					<c:if test="${map.tiezi.zhiding==1}">
						<li><a href="javascript:;" onclick="qxbkzd('${map.tiezi.id}');"><img src="${path}/static/image/magic/stick.small.gif"/>取消板块</a></li>
					</c:if>
					<c:if test="${not empty map.tiezi.jinghua}">
						<li><a href="javascript:;" onclick="qxszjh('${map.tiezi.id}');"><img src="${path}/static/image/magic/bump.small.gif" />取消精华</a></li>
					</c:if>
					<c:if test="${!not empty map.tiezi.jinghua}">
						<li><a href="javascript:;" onclick="szjh('${map.tiezi.id}','1');"><img src="${path}/static/image/magic/bump.small.gif" />精华1</a></li>
						<li><a href="javascript:;" onclick="szjh('${map.tiezi.id}','2');"><img src="${path}/static/image/magic/bump.small.gif" />精华2</a></li>
						<li><a href="javascript:;" onclick="szjh('${map.tiezi.id}','3');"><img src="${path}/static/image/magic/bump.small.gif" />精华3</a></li>
					</c:if>
					
					</ul>
				</c:if>
				</p>
			</div>
          </div> 
          <c:if test="${not empty map.tiezi.lastupdate}">
          <div id="comment_237">
	          	<div class="cmtl xld xlda">
					<dl class="cl">
						<dd>${map.tiezi.lastupdate}</dd>
					</dl>
				</div>
			</div>
		</c:if>
          <div id="comment_240">
           <div id="cmtform_240"></div>
          </div> </td> 
        </tr> 
        <c:if test="${!empty huifumap.list}">
        <tr class="ad"> 
         <td class="pls"></td> 
         <td class="plc"> 
          <ul class="ttp cl"> 
          
           <li <c:if test="${orderby!='0'}">class="xw1 a"</c:if> ><a href="${path}/tiezi/${map.tiezi.id}_1_1.html">正序浏览</a></li> 
           <li <c:if test="${orderby=='0'}">class="xw1 a"</c:if> ><a href="${path}/tiezi/${map.tiezi.id}_1_0.html">倒序浏览</a></li> 
          </ul> </td> 
        </tr> 
        </c:if>
       </tbody>
      </table> 
     </div>
     <div >
      <table  cellspacing="0" cellpadding="0"> 
       <tbody>
       
       <c:forEach items="${huifumap.list}" var="huifumap">
      
        <tr> 
         <td class="pls"> 
          <div> 
           <div class="avatar" onmouseover="showauthor(this, 'userinfo257')">
             <a href="${path}/member/${huifumap.userid}_1.html" target="_blank"><img src="${path}/file/${huifumap.userimg}" /></a>
           </div> 
           <div class="qing_pi"> 
            <div class="authi">
             <a href="${path}/member/${huifumap.userid}_1.html" target="_blank" class="xw1" style="color: #CC3333">${huifumap.loginname}</a> 
            </div> 
           </div> 
           <div class="qing_v_card"> 
            <p><em><font <c:if test="${huifumap.tiezi.groupid==1}">style="color: #CC3333"</c:if>>${huifumap.groupname}</font></em></p> 
            <div class="${huifumap.classname}"></div>
            <div class="qcard">
             <div class="tns xg2">
              <table cellspacing="0" cellpadding="0">
               <tbody>
                <tr>
                 <th><p><a href="${path}/member/${huifumap.userid}_2.html" class="xi2">${huifumap.tiezicount}</a></p>帖子</th>
                 <th><p><a href="" class="xi2">${huifumap.userhuifucount}</a></p>回复</th>
                 <td><p><a href="" class="xi2">${huifumap.jifen}</a></p>积分</td>
                </tr>
               </tbody>
              </table>
             </div>
            </div> 
           </div>
          </div> </td> 
         <td id="plc_257" class="plc"> 
          <div class="pi"> 
           <strong class="xg1">
           <c:if test="${huifumap.orderby==1}">
            <a href="javascript:;" title="" >沙发</a> 
           </c:if>
           <c:if test="${huifumap.orderby==2}">
            <a href="javascript:;" title="" >板凳</a> 
           </c:if>
           <c:if test="${huifumap.orderby==3}">
            <a href="javascript:;" title="" >地板</a> 
           </c:if>
           <c:if test="${huifumap.orderby!=1&&huifumap.orderby!=2&&huifumap.orderby!=3}">
            <a href="javascript:;" title="" ><em>${huifumap.orderby}</em><sup>#</sup></a> 
           </c:if>
            </strong> 
           <div class="pti"> 
            <div class="pdbt"> 
            </div> 
            <div class="authi xg1"> 
             <em id="authorposton257">发表于 ${huifumap.createtime}</em> 
            </div> 
           </div> 
          </div>
          <div class="pct"> 
           <div class="pcb"> 
            <div class="t_fsz"> 
             <table cellspacing="0" cellpadding="0">
              <tbody>
               <tr>
                <td class="t_f" style="overflow: hidden;" >
                <c:if test="${not empty  huifumap.huifuid and huifumap.isdel eq '0'}">
	                 <div class="quote">
		                 <blockquote>
		                 <font size="2"><font color="#999999">${huifumap.ploginname} 发表于 ${huifumap.pcreatetime} </font>
		                 <font style="margin-left : 620px;">
		                 <c:if test="${huifumap.porderby==1}">沙发</c:if>
				         <c:if test="${huifumap.porderby==2}">板凳</c:if>
				         <c:if test="${huifumap.porderby==3}">地板</c:if>
				         <c:if test="${huifumap.porderby!=1&&huifumap.porderby!=2&&huifumap.porderby!=3}">
				            <em>${huifumap.porderby}</em><sup>#</sup> 
				         </c:if>
		                 </font></font>
		                 <br>${huifumap.pcontenthtml}</blockquote>
	                 </div>
                </c:if>
                 ${huifumap.contenthtml}
                </td>
               </tr>
              </tbody>
             </table> 
            </div> 
           </div>
          </div> 
          <div id="po_257" class="po"> 
           <div class="pob cl"> 
            <p> 
           
           <c:if test="${sessionScope.indexuser !=null}">
            	<c:if test="${huifumap.isdel eq '0'}">
	            	<a href="javascript:;" onclick="addhuifu(${huifumap.id})">回复</a> 
            	</c:if>
           </c:if>
           	<c:if test="${sessionScope.indexuser.groupid==1 or sessionScope.indexuser.groupid==2 or sessionScope.indexuser.id==huifumap.userid}">
            	<c:if test="${huifumap.isdel eq '0'}">
            		<a href="javascript:;" onclick="delhuifu(${huifumap.id})">删除回复</a> 
            	</c:if>
            </c:if>
            </p> 
           </div> 
          </div> 
          <div id="comment_257">
           <div id="cmtform_257"></div>
          </div> </td> 
        </tr> 
        <tr class="ad"> 
         <td class="pls"></td> 
         <td class="plc"> </td> 
        </tr> 
        
        
         </c:forEach>
       </tbody>
      </table> 
     </div>
    </div> 
    <div class="pgs mtm mbm cl"> 
     <div class="pgt"></div> 
     
    <c:if test="${!empty huifumap.list}">
     <div class="bm bw0 pgs cl"> 
        <div class="pg">
        <c:if test="${huifumap.pagestart!=1}">
        <a href="${path}/tiezi/${map.tiezi.id}_${huifumap.pagestart-1}_${orderby}.html" class="prev"></a>
        </c:if>
         <strong>${huifumap.pagestart}</strong>
         <c:if test="${huifumap.pagestart!=huifumap.totalPages}">
         <a href="${path}/tiezi/${map.tiezi.id}_${huifumap.pagestart+1}_${orderby}.html" class="nxt"></a>
         </c:if>
        </div>
         <span class="y pgb" ><a href="${path}/bk/${map.tiezi.zbankuaiid}_1_0_0.html">返回列表</a></span> 
      </div>
    </c:if>
    </div> 
    <div id="diyfastposttop" class="area"></div>
    <div id="f_pst" class="pl mbm"> 
    <!-- 发帖文件框 -->
    
      <table cellspacing="0" cellpadding="0"> 
       <tbody>
       
       <c:if test="${sessionScope.indexuser!=null}">
       <c:if test="${flag==1 }">
       <!-- 允许回复 -->
        <tr> 
         <td class="pls"> 
          <div class="avatar">
           <img src="${path}/file/${sessionScope.indexuser.img}" />
          </div> </td> 
         <td class="plc"> <span id="fastpostreturn"></span> 
          <div class="cl"> 
           <div id="fastsmiliesdiv" class="y">
            <div id="fastsmiliesdiv_data">
             <div id="fastsmilies"></div>
            </div>
           </div>
           <div class="hasfsl" id="fastposteditor"> 
            <div class="tedt mtn"> 
             <div class="tedt"> 
				<div id="myEditor" style="width:850px;height:200px;"></div>
        	</div> 
            </div> 
           </div> 
          </div> 
           <p class="ptm pnpost"> 
           <button type="button" class="pn pnc vm" onclick="geteditorhtml();" ><strong>发表回复</strong></button> 
             </p> </td> 
        </tr>
       </c:if>
       <c:if test="${flag==0 }">
       <!-- 不允许回复 -->
       	<tr> 
         <td class="pls"> 
          <div class="avatar">
           <img src="${path}/file/${sessionScope.indexuser.img}" />
          </div> </td> 
         <td class="plc"> <span id="fastpostreturn"></span> 
          <div class="cl"> 
           <div id="fastsmiliesdiv" class="y">
            <div id="fastsmiliesdiv_data">
             <div id="fastsmilies"></div>
            </div>
           </div>
           <div class="hasfsl" > 
            <div class="tedt mtn"> 
             <div class="area" > 
              <textarea rows="6" cols="100" class="pt" disabled="disabled" ></textarea> 
             </div> 
            </div> 
           </div> 
          </div> 
           <p class="ptm pnpost"> 
           <label>您没有回帖权限</label> 
             </p> </td> 
        </tr>
       </c:if>
        </c:if> 
         <c:if test="${sessionScope.indexuser==null}">
         <!-- 没有登录 -->
        <tr> 
         <td class="pls"> 
          <div class="avatar">
           <img src="${path}/file/${sessionScope.indexuser.img}" />
          </div> </td> 
         <td class="plc"> <span id="fastpostreturn"></span> 
         <div class="cl">
		<div id="fastsmiliesdiv" class="y"><div id="fastsmiliesdiv_data"><div id="fastsmilies"></div></div></div><div class="hasfsl" id="fastposteditor">
		<div class="tedt mtn">
		<div class="bar">
		</div>
		<div class="area">
			<div class="pt hm">
			您需要登录后才可以回帖 <a href="${path}/login/index.do"  class="xi2">登录</a> | <a href="${path}/zhuc/index.do" class="xi2">立即注册</a>
			</div>
		</div>
		</div>
		</div>
		</div>
         
           <p class="ptm pnpost"> 
           <button type="button"  onclick="gotologin();" class="pn pnc vm" ><strong>发表回复</strong></button> 
           <label>请登录后发表回复</label> 
             </p> </td> 
        </tr> 
        </c:if> 
       </tbody>
      </table> 
     <!-- 发帖文件框 -->
    </div> 
   </div> 
  </div>
<%@ include file="/WEB-INF/inc/foot.jsp"%>
 </body>
</html>