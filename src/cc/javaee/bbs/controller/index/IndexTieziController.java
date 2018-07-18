package cc.javaee.bbs.controller.index;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.javaee.bbs.model.Bankuai;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.Tiezi;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.model.Zhuti;
import cc.javaee.bbs.service.BankuaiService;
import cc.javaee.bbs.service.HuifuService;
import cc.javaee.bbs.service.TieziService;
import cc.javaee.bbs.service.UserService;
import cc.javaee.bbs.service.ZhutiService;
import cc.javaee.bbs.tool.PublicStatic;
/*
 * 帖子的查询
 * 
 */
@Controller
@RequestMapping("/tiezi")
public class IndexTieziController {
	@Autowired
	BankuaiService bankuaiService;
	
	@Autowired
	TieziService tieziService;
	
	@Autowired
	ZhutiService zhutiService;
	
	@Autowired
	HuifuService huifuService;
	
	@Autowired
	UserService userService;

	private static Logger log = Logger.getLogger(IndexTieziController.class);

	//根据帖子id查询信息
	@RequestMapping("index.do")
	public String findAllWhere(HttpServletRequest request, Model model,String bankuaiid,String id,String orderby,PageBean<Map<String, Object>> page) {
		Map<String, Object> map= tieziService.findbytieziid(id);
		model.addAttribute("map", map);
		//判断回复权限
		User user=(User)request.getSession().getAttribute(PublicStatic.USER);
		if(user!=null){
			String flag = userService.ishuifu(map.get("huifugroup")+"", user);
			model.addAttribute("flag", flag);
		}
		Map<String, Object> qmap=new HashMap<String, Object>();
		qmap.put("id", id);
		if("0".equals(orderby)){
			qmap.put("orderby", " desc");
		}else{
			qmap.put("orderby", " asc ");
		}
		
		PageBean<Map<String, Object>> huifumap = huifuService.findpage(qmap, page);
		model.addAttribute("huifumap", huifumap);
		model.addAttribute("orderby", orderby);
		return "jsp/index/neirong";
	}
	
	@ResponseBody
	@RequestMapping("updatefindcount.do")
	public String updatefindcount(int id){
		List<String> list=new ArrayList<String>();
		list.add("1");
		tieziService.updatefindcount(id);
		return "1";
	}
	
}
