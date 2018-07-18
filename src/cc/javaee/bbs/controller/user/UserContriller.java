package cc.javaee.bbs.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.javaee.bbs.model.User;
import cc.javaee.bbs.service.UserService;
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;
/*
 * 用户操作页面
 * 
 */
@Controller
@RequestMapping("/user")
public class UserContriller {
	
	@Autowired
	UserService userService;
	
	
	//跳转首页
	@RequestMapping("index.do")
	public String add(HttpServletRequest request) {
		return "jsp/index/user/user-ziliao";
	}
	
	//跳转首页
	@RequestMapping("update.do")
	public String update(HttpServletRequest request, Model model,User user) {
		User sessionuser=(User)request.getSession().getAttribute(PublicStatic.USER);
		user.setId(sessionuser.getId());
		userService.update(user);
		
		user=userService.findbyuserid(sessionuser.getId());
		request.getSession().setAttribute(PublicStatic.USER, user);
		return "redirect:/user/index.do";
	}
	
	
	//退出
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	//跳转修改密码
	@RequestMapping("topwd.do")
	public String topwd(HttpServletRequest request) {
		return "jsp/index/user/user-pwd";
	}
	
	//修改密码
	@ResponseBody
	@RequestMapping("pwd.do")
	public String pwd(HttpServletRequest request,String pwd ,String newpwd) {
		User sessionuser=(User)request.getSession().getAttribute(PublicStatic.USER);
		User user=new User();
		user.setId(sessionuser.getId());
		user.setPwd(pwd);
		String login = userService.login(user, request);
		if("1".equals(login)){
			user.setPwd(Tool.MD5(newpwd));
			userService.update(user);
			return "1";
		}else{
			return "0";
		}
	}
	
}
