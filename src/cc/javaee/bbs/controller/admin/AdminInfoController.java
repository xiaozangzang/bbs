package cc.javaee.bbs.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import cc.javaee.bbs.model.Info;
import cc.javaee.bbs.service.InfoService;
/*
 * 网站信息
 * 
 */

@Controller
@RequestMapping("/admin/info")
public class AdminInfoController {
	@Autowired
	InfoService infoService;

	private static Logger log = Logger.getLogger(AdminInfoController.class);

	//页面查询
	@RequestMapping("index.do")
	public String findAllWhere(HttpServletRequest request, Model model) {
		Info info = infoService.find();
		model.addAttribute("info", info);
		return "jsp/admin/info";
	}
	//修改
	@RequestMapping("update.do")
	public String updateoradd(HttpServletRequest request,Info info) {
		info.setId(1);
		infoService.update(info);
		info = infoService.find();
		request.getSession().getServletContext().setAttribute("bbsinfo", info);
		return "redirect:/admin/info/index.do ";
	}
}
