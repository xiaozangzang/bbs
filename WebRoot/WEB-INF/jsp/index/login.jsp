<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  
<title>登录-${applicationScope.bbsinfo.name}</title>
 <meta name="keywords" content="登录" /> 
  <meta name="description" content="登录" /> 
 <link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_common.css" />
 <link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_forum_viewthread.css" /> 
 <link rel="stylesheet" type="text/css" href="${path}/public/css/tubiao.css" /> 
 <script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
 <script type="text/javascript">
 
 document.onkeydown=function(e){
	 var keycode=document.all?event.keyCode:e.which;
	 if(keycode==13)submitlogin();
};
 
 function isusername(){
	 var name=$.trim($("#name").val());
	 $("#name").val(name);
	 if(name==""){
		 $("#namespan").html("用户不能为空");
		 $("#namespan").show();
		 return false;
	 }else{
		 $("#namespan").hide();
		 return true;
	 }
 }
 function ispwd(){
	 var pwd=$.trim($("#pwd").val());
	 $("#pwd").val(pwd);
	 if(pwd.length<6){
		 $("#pwdspan").html("密码长度不能小于6位");
		 $("#pwdspan").show();
		 return false;
	 }else{
		 $("#pwdspan").hide();
		 return true;
	 }
 }
 
 function isyanzhengma(){
	 var flag=false;
	 var yanzhengma=$.trim($("#yanzhengma").val());
	 $("#yanzhengma").val(yanzhengma);
	 if(yanzhengma.length<1){
		 $("#yanzhengmaspan").html("验证码不能为空");
		 $("#yanzhengmaspan").show();
		 return flag;
	 }else{
		 $("#yanzhengmaspan").hide();
	 }
	 var param={};
	 param.yanzhengma=yanzhengma;
	 $.ajax({
		   type: "POST",
		   url: "${path}/yanzhengma/isyanzhengma.do",
		   data: param,
		   dataType:"json",
		   async: false,
		   success: function(data){
			   if(data=="0"){
				   $("#yanzhengmaspan").html("验证码错误");
					$("#yanzhengmaspan").show();
					flag=false;
			   }else{
				   $("#yanzhengmaspan").html('<p class="duihao"></p>');
					$("#yanzhengmaspan").show();
					flag=true;
			   }
		   }
	 });
	 return flag;
 }
 
 function submitlogin(){
	 if(isusername()&&ispwd()&&isyanzhengma()){
		 var name=$.trim($("#name").val());
		 var pwd=$.trim($("#pwd").val());
		 var yanzhengma=$.trim($("#yanzhengma").val());
		 var param={};
		 param.loginname=name;
		 param.pwd=pwd;
		 param.yanzhengma=yanzhengma;
		 param.pathlocation='${pathlocation}';
		 $.ajax({
			   type: "POST",
			   url: "${path}/login/login.do",
			   data: param,
			   dataType: "json", 
			   async: false,
			   success: function(data){
				   var flag=data.flag;
				   var pathlocation=data.pathlocation;
				   if(flag==99){
					   $("#namespan").html("用户名错误");
						$("#namespan").show();
				   }else if(flag==88){
					   $("#pwdspan").html("密码错误");
						$("#pwdspan").show();
						$("#namespan").hide();
				   }else if(flag==77){
					   $("#yanzhengmaspan").html("验证码错误");
						$("#yanzhengmaspan").show();
						$("#namespan").hide();
						$("#pwdspan").hide();
				   }else if(flag==0){
					   $("#namespan").html("用户名限制登录");
						$("#namespan").show();
						$("#pwdspan").hide();
				   }else if(flag==1){
					   window.location.href=pathlocation;					   
				   }else{
					   alert("系统错误");
				   }
			   }
		 });
	 }
 }
 
 function updateyanzhengma(){
     document.getElementById('yanzhengmaimg').src= '${path}/yanzhengma/index.do?t='+new Date().getTime();
	 
 }
</script>
</head>
 <body id="nv_forum" class="pg_index">

 <%@ include file="/WEB-INF/inc/top.jsp"%>
 
    <div class="y"> 
  </div> 
  <div class="y qing_toptb"> 
  </div>   
  <div id="wp" class="wp">
   <div id="ct" class="wp ptm cl"> 
    <div class="mn"> 
     <div class="bm" id="main_message"> 
      <p id="returnmessage4"></p> 
      <form method="post" id="form" action=""> 
       <div id="layer_reg" class="bm_c"> 
        <div class="mtw"> 
         <div id="reginfo_a"> 
          <div class="rfm"> 
           <table> 
            <tbody>
             <tr> 
              <th><span class="rq">*</span><label for="ZODRdi">用户名:</label></th> 
              <td><input type="text" name="name" id="name" class="px"  size="25" maxlength="15"  onblur="isusername();"/></td> 
              <td class="tipcol" colspan="3">
              <i id="namespan" class="p_tip"></i>
              </td> 
             </tr> 
             <tr> 
              <th><span class="rq">*</span><label for="ZODRdi">密码:</label></th> 
              <td><input type="password" class="px" id="pwd"  size="25" maxlength="15"  onblur="ispwd();"/></td> 
              <td class="tipcol" colspan="3">
              <i id="pwdspan" class="p_tip"></i>
              </td> 
             </tr> 
             <tr > 
              <th><span class="rq">*</span><label for="ZODRdi">验证码:</label></th> 
              <td style="height: 56px;">
              <input style="width: 125px;margin-top: -20px;" type="text" name="yanzhengma" id="yanzhengma" class="px"  size="4" maxlength="4"  onblur="isyanzhengma();"/>
              <img src="${path}/yanzhengma/index.do" alt="验证码" height="30px;" id="yanzhengmaimg" onclick="updateyanzhengma();"/>
              </td> 
              <td class="tipcol" colspan="3">
              <i id="yanzhengmaspan" class="p_tip"></i>
              </td> 
             </tr> 
            </tbody>
           </table> 
          </div> 
         </div> 
        </div> 
       </div> 
       <div id="layer_reginfo_b"> 
        <div class="rfmrig mbw"> 
         <span id="reginfo_a_btn"> <em>&nbsp;</em> <input class="btn" id="loginbtn"  type="button" value="登录" onclick="submitlogin();"/> </span> 
        </div> 
       </div> 
      </form> 
     </div> 
    </div> 
   </div> 
  </div>
<%@ include file="/WEB-INF/inc/foot.jsp"%>
 </body>
</html>