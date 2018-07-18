package cc.javaee.bbs.controller.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.javaee.bbs.model.Tiezi;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.service.TieziService;
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;
/*
 * 后台公共使用
 * 
 */
@Controller
@RequestMapping("/admin/common")
public class AdminCommonController {
	
	@Autowired
	TieziService tieziService;
	
	
	private static Logger log = Logger.getLogger(AdminCommonController.class);

	
	//全局置顶
	@ResponseBody
	@RequestMapping("updateallzhiding.do")
	public Map<String, String> updateallzhiding(HttpServletRequest request,int id) {
		Map<String, String> map=new HashMap<String, String>();
		Tiezi tiezi=new Tiezi();
		tiezi.setId(id);
		tiezi.setZhiding(PublicStatic.ALLZHIDING);
		User user=(User) request.getSession().getAttribute(PublicStatic.USER);
		tiezi.setLastupdate(""+user.getGroupname()+"\""+user.getLoginname()+"\"于"+Tool.getyyyyMMddHHmmss()+"将帖子全局置顶"+"</br>");
		tieziService.update(tiezi);
		map.put("flag", "1");
		return map;
	}
	//取消全局置顶
	@ResponseBody
	@RequestMapping("updateallqxzhiding.do")
	public Map<String, String> updateallqxzhiding(HttpServletRequest request,int id) {
		Map<String, String> map=new HashMap<String, String>();
		Tiezi tiezi=new Tiezi();
		tiezi.setId(id);
		tiezi.setZhiding("");
		User user=(User) request.getSession().getAttribute(PublicStatic.USER);
		tiezi.setLastupdate(""+user.getGroupname()+"\""+user.getLoginname()+"\"于"+Tool.getyyyyMMddHHmmss()+"将帖子取消全局置顶"+"</br>");
		tieziService.update(tiezi);
		map.put("flag", "1");
		return map;
	}
	
}
