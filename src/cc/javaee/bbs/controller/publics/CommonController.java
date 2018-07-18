package cc.javaee.bbs.controller.publics;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.javaee.bbs.model.User;
import cc.javaee.bbs.service.UserService;
import cc.javaee.bbs.tool.PublicStatic;
/*
 * 公共的操作
 * 
 */
@Controller
@RequestMapping("/common")
public class CommonController {
	
	@Autowired
	UserService userService;
	
	private static Logger log = Logger.getLogger(CommonController.class);

	//每五秒钟调用一次，更新在线时间
	@ResponseBody
	@RequestMapping("updateuseronlinetime.do")
	public void updateuseronlinetime(HttpServletRequest request) {
		User user=(User) request.getSession().getAttribute(PublicStatic.USER);
		if(user!=null){
			Map<Integer, Long> map= (Map<Integer, Long>)request.getSession().getServletContext().getAttribute("updateuseronlinetime");
			if(map==null){
				map=new HashMap<Integer, Long>();
			}
			long l=System.currentTimeMillis();
			if(map.get(user.getId())==null||(l-map.get(user.getId())>4*1000)){
				userService.updateuseronlinetime(user);
				map.put(user.getId(), l);
				request.getSession().getServletContext().setAttribute("updateuseronlinetime", map);
			}
		}
	}
}
