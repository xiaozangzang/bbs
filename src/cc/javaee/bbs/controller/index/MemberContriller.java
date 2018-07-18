package cc.javaee.bbs.controller.index;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.Tiezi;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.service.BankuaiService;
import cc.javaee.bbs.service.TieziService;
import cc.javaee.bbs.service.UserLiuyanService;
import cc.javaee.bbs.service.UserService;
import cc.javaee.bbs.service.ZhutiService;
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;
/*
 * 资料页面
 * 
 */
@Controller
@RequestMapping("/member")
public class MemberContriller {
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserLiuyanService userLiuyanService;
	
	@Autowired
	TieziService tieziService;
	
	//跳转首页
	@RequestMapping("index.do")
	public String index(HttpServletRequest request,Model model,int id,String flag,PageBean<Tiezi> page) {
		User user=new User();
		user.setId(id);
		user = userService.findbyid(user);
		model.addAttribute("user", user);
		if("1".equals(flag)){
			Map<String, Object> ziliao = userService.findziliao(user);
			model.addAttribute("ziliao", ziliao);
			//查询个人资料
			return "jsp/index/member/xinxi-ziliao";
		}else if("2".equals(flag)){
			//查询查询主题
			Tiezi tiezi=new Tiezi();
			tiezi.setCreateuserid(user.getId());
			page.setPageSize(10);
			PageBean<Tiezi> tiezipage = tieziService.findpage(tiezi, page);
			model.addAttribute("tiezipage", tiezipage);
			return "jsp/index/member/xinxi-zhuti";
		}else if("3".equals(flag)){
			//查询留言
			
			List<Map<String, Object>> liuyanlist= userLiuyanService.find(id);
			model.addAttribute("liuyanlist", liuyanlist);
			return "jsp/index/member/xinxi-liuyan";
		}else{
			//查询个人资料
			return "jsp/index/member/xinxi-ziliao";
		}
	}
	
	
	
}
