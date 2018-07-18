package cc.javaee.bbs.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cc.javaee.bbs.model.Gonggao;
import cc.javaee.bbs.model.Info;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.service.GonggaoService;
import cc.javaee.bbs.service.InfoService;
/*
 * 网站信息
 * 
 */
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;

@Controller
@RequestMapping("/admin/gonggao")
public class AdminGonggaoController {
	@Autowired
	GonggaoService gonggaoService;

	private static Logger log = Logger.getLogger(AdminGonggaoController.class);

	//公告查询
	@RequestMapping("index.do")
	public String findAllWhere(HttpServletRequest request, Model model) {
		Gonggao gonggao = new Gonggao();
		gonggao = gonggaoService.find(gonggao);
		model.addAttribute("gonggao", gonggao);
		return "jsp/admin/gonggao";
	}
	//修改
	@RequestMapping("update.do")
	public String updateoradd(HttpServletRequest request,Gonggao gonggao) {
		gonggao.setId(0);
		User user=(User) request.getSession().getAttribute(PublicStatic.USER);
		gonggao.setCreateuserid(user.getId());
		gonggao.setCreatetime(Tool.getyyyyMMddHHmmss());
		gonggaoService.update(gonggao);
		request.getSession().getServletContext().setAttribute("bbsgonggao", gonggao);
		return "redirect:/admin/gonggao/index.do ";
	}
}
