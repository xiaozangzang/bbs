package cc.javaee.bbs.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.javaee.bbs.model.Link;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.service.LinkService;
import cc.javaee.bbs.tool.PublicStatic;

/*
 * 友情链接
 * 
 */
@Controller
@RequestMapping("/admin/link")
public class AdminLinkController {
	@Autowired
	LinkService linkService;

	private static Logger log = Logger.getLogger(AdminLinkController.class);

	//后台页面查询
	@RequestMapping("index.do")
	public String findAllWhere(HttpServletRequest request, Model model,Link link,PageBean<Link> page) {
		User user=(User) request.getSession().getAttribute(PublicStatic.USER);
		link.setCreateuserid(user.getId());
		page = linkService.findpage(link,page);
		model.addAttribute("page", page);
		return "jsp/admin/link/index";
	}
	
	//跳转到修改页面
	@RequestMapping("toupdateoradd.do")
	public String toupdateoradd(Model model,Link link) {
		if(link!=null&&link.getId()!=null){
			link=linkService.find(link).get(0);
			model.addAttribute("link", link);
		}
		return "jsp/admin/link/updateoradd";
	}
	//修改或者新增
	@RequestMapping("updateoradd.do")
	public String updateoradd(HttpServletRequest request,Link link) {
		User user=(User) request.getSession().getAttribute(PublicStatic.USER);
		link.setCreateuserid(user.getId());
		if(link.getId()!=null){
			linkService.update(link);
		}else{
			linkService.insert(link);
		}
		return "redirect:index.do ";
	}
	//删除
	@ResponseBody
	@RequestMapping("del.do")
	public String del(int id) {
		String result=linkService.delete(id);
		return result;
	}
	
	
}
