package cc.javaee.bbs.controller.index;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.javaee.bbs.model.User;
import cc.javaee.bbs.service.GroupService;
import cc.javaee.bbs.service.UserService;
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;
/*
 * 主题的查询
 * 
 */
@Controller
@RequestMapping("/zhuc")
public class ZhucController {

	@Autowired
	UserService userService;
	@Autowired
	GroupService groupService;
	
	private static Logger log = Logger.getLogger(ZhucController.class);
	
	//跳转注册页面
	@RequestMapping("index.do")
	public String toindex() {
		return "jsp/index/zhuc";
	}
	//新增
	@ResponseBody
	@RequestMapping("add.do")
	public Map<String, String> add(HttpServletRequest request,User user,String yanzhengma) {
		Map<String, String> jsonmap=new HashMap<String, String>();
		String flag="1";
		String msg="注册成功!";
		HttpSession session = request.getSession(true); 
		String yanzhengmasession=(String)session.getAttribute("yanzhengma");
		if(!yanzhengma.equalsIgnoreCase(yanzhengmasession)){
			flag="0";
			msg="验证码错误！";
		}else if(user.getLoginname().length()<6){
			flag="0";
			msg="用户名小于6位！";
		}else if(userService.isusername(user.getLoginname()).equals("0")){
			flag="0";
			msg="用户名重复！";
		}else if(user.getPwd().length()<6){
			flag="0";
			msg="密码小于6位！";
		}else{
			session.removeAttribute("yanzhengma");
			user.setName("王二狗");
			user.setZhuceip(Tool.getIp(request));
			user.setCreatetime(Tool.getyyyyMMddHHmmss());
			user.setLastlogintime(Tool.getyyyyMMddHHmmss());
			user.setPwd(Tool.MD5(user.getPwd()));
			user.setFlag("1");
			user.setJifen(0);
			user.setImg("touxiang.jpg");
			userService.insert(user);
			//注册用户 新增组的关联关系
			String loginname = user.getLoginname();
			user = new User();
			user.setLoginname(loginname);
			user = userService.findbyid(user);
			groupService.updategroupbyuser(user.getId(), PublicStatic.GROUPVIP);
		}
		jsonmap.put("flag", flag);
		jsonmap.put("msg", msg);
//		return "redirect:/login/index.do";
		return jsonmap;
	}
	//验证用户名
	@ResponseBody
	@RequestMapping("isusername.do")
	public String isusername(HttpServletRequest request,User user) {
		String flag=userService.isusername(user.getLoginname());
		return flag;
	}
}
