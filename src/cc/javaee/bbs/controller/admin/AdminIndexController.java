package cc.javaee.bbs.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
/*
 * 
 * 跳转后台首页
 * 
 */


@Controller
@RequestMapping("/admin")
public class AdminIndexController {

	private static Logger log = Logger.getLogger(AdminIndexController.class);

	//后台页面查询
	@RequestMapping("index.do")
	public String findAllWhere(HttpServletRequest request, Model model) {
		return "jsp/admin/index";
	}
	
	
	
}
