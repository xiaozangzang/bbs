package cc.javaee.bbs.controller.index;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cc.javaee.bbs.model.Bankuai;
import cc.javaee.bbs.model.Gonggao;
import cc.javaee.bbs.model.Link;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.service.BankuaiService;
import cc.javaee.bbs.service.CommonService;
import cc.javaee.bbs.service.GonggaoService;
import cc.javaee.bbs.service.LinkService;
import cc.javaee.bbs.tool.PublicStatic;
/*
 * 首页的查询
 * 
 */
@Controller
@RequestMapping("/")
public class IndexController {
	@Autowired
	BankuaiService bankuaiService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	LinkService linkService;
	
	@Autowired
	GonggaoService gonggaoService;

	private static Logger log = Logger.getLogger(IndexController.class);

	@RequestMapping("index.do")
	public String findAllWhere(HttpServletRequest request, Model model,Bankuai bankuai,PageBean<Bankuai> page) {
		//查询板块
		List<Bankuai> bankuailist = bankuaiService.find(bankuai);
		for (Bankuai bankuai2 : bankuailist) {
			String tieziname = bankuai2.getTieziname();
			if(tieziname!=null && tieziname.length() > 10){
				tieziname = tieziname.substring(0, 10)+"...";
				bankuai2.setTieziname(tieziname);
			}
		}
		//查询公告
		Gonggao gonggao = gonggaoService.find(new Gonggao());
		model.addAttribute("gonggao",gonggao);
		model.addAttribute("bankuailist", bankuailist);
		//查询统计
//		Map<String, Object> indexmap = commonService.indextongji();
		model.addAttribute("indexmap", PublicStatic.indexmap);
		//查询最新帖子-获取静态缓存数据
		model.addAttribute("ztiezi", PublicStatic.ztiezi);
		//查询友情链接
		Link link=new Link();
		link.setIsshow("1");
		List<Link> linklist = linkService.find(link);
		model.addAttribute("linklist", linklist);
		return "jsp/index/index";
	}
}
