<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div id="ft" class="qing_foot cl"> 
   <div class="wp cl"> 
    <div id="flk" class="z"> 
     <p>
     ${applicationScope.bbsinfo.foothtml}
      </p> 
    </div> 
    <div id="frt" class="y"> 
     <p>技术支持 <a href="http://www.javaee.cc" target="_blank">WKTS</a> <em>V1.0</em> &copy; 2017-2018
     </p> 
    </div> 
   </div> 
  </div> 
  <div id="scrolltop" class="js_scrolltop"> 
   <a title="返回顶部" class="scrolltopa" id="scrolltopa" style="display: none;"> <b>返回顶部</b> </a> 
  </div> 
  <script type="text/javascript">
  function updateuseronlinetime(){
	  $.ajax({
		   type: "POST",
		   url: "${path}/common/updateuseronlinetime.do",
		   async: true,
		   success: function(data){
		   }
	 });
  }
  
  setInterval("updateuseronlinetime()",30000);
  
</script>

 