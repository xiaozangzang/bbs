package cc.javaee.bbs.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.service.GroupService;
import cc.javaee.bbs.service.UserService;
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;
/*
 * 后台用户管理页面
 * 
 */
@Controller
@RequestMapping("/admin/user")
public class AdminUserContriller {
	
	@Autowired
	UserService userService;
	
	@Autowired
	GroupService groupService;
	
	
	//跳转首页
	@RequestMapping("index.do")
	public String add(HttpServletRequest request, Model model,User user,PageBean<User> page) {
		page = userService.findpage(user,page);
		model.addAttribute("page", page);
		model.addAttribute("quser", user);
		return "jsp/admin/user/index";
	}
	
	//更新
	@RequestMapping("update.do")
	public String update(HttpServletRequest request, Model model,User user) {
		User sessionuser=(User)request.getSession().getAttribute(PublicStatic.USER);
		user.setId(sessionuser.getId());
		userService.update(user);
		return "redirect:/user/index.do";
	}
	
	//删除
	@ResponseBody
	@RequestMapping("del.do")
	public String del(HttpServletRequest request, Model model,User user) {
		return userService.delete(user.getId());
	}
	//重置密码
	@ResponseBody
	@RequestMapping("updatepwd.do")
	public String updatepwd(HttpServletRequest request, Model model,User user) {
		String pwd="123456";
		user.setPwd(Tool.MD5(pwd));
		userService.update(user);
		return "1";
	}
	//重置密码
	@ResponseBody
	@RequestMapping("updateflag.do")
	public String updateflag(HttpServletRequest request, Model model,User user) {
		userService.update(user);
		return "1";
	}
	
	//设置管理员
	@ResponseBody
	@RequestMapping("updategroup.do")
	public String updategroup(HttpServletRequest request, Model model,User user,int groupid) {
		boolean b = groupService.updategroupbyuser(user.getId(), groupid);
		if(b){
			return "1";
		}else{
			return "0";
		}
	}
}
