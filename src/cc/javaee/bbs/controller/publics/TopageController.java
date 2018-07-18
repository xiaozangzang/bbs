package cc.javaee.bbs.controller.publics;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * 公共页面
 * 
 */


@Controller
@RequestMapping("/topage")
public class TopageController {

	//没有权限发帖子提示页面
	@RequestMapping("quanxian.do")
	public String quanxian() {
		return "inc/quanxian";
	}	
}
