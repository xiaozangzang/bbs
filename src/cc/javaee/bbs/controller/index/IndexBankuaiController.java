package cc.javaee.bbs.controller.index;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cc.javaee.bbs.model.Bankuai;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.Tiezi;
import cc.javaee.bbs.model.Zhuti;
import cc.javaee.bbs.service.BankuaiService;
import cc.javaee.bbs.service.TieziService;
import cc.javaee.bbs.service.ZhutiService;
/*
 * 板块的查询
 * 
 */
@Controller
@RequestMapping("/bk")
public class IndexBankuaiController {
	@Autowired
	BankuaiService bankuaiService;
	
	@Autowired
	TieziService tieziService;
	
	@Autowired
	ZhutiService zhutiService;

	private static Logger log = Logger.getLogger(IndexBankuaiController.class);

	//首页查询
	@RequestMapping("index.do")
	public String findAllWhere(HttpServletRequest request, Model model,String bankuaiid,String zhutiid,PageBean<Tiezi> page,String orderby) {
		//查询当前板块
		Bankuai bankuai= bankuaiService.findbyid(bankuaiid);
		
		//查询主题列表
		Zhuti zhuti=new Zhuti();
		zhuti.setBankuaiId(Integer.parseInt(bankuaiid));
		List<Zhuti> zhutilist = zhutiService.find(zhuti);
		//查询板块的帖子
		Tiezi tiezi=new Tiezi();
		tiezi.setBankuaiId(Integer.parseInt(bankuaiid));
		tiezi.setOrderby(orderby);
		if(zhutiid!=null&&!zhutiid.equals("0")){
			tiezi.setZhutiid(zhutiid);
		}else{
			zhutiid="0";
		}
		//查询列表
//		long currentTimeMillis = System.currentTimeMillis();
		page = tieziService.findpagebybankuanid(tiezi, page);
		//今日的帖子总数
		int nowcount=tieziService.findnowcount(bankuaiid);
		//查询置顶
		List<Tiezi> zhidinglist= tieziService.findzhiding(bankuaiid);
//		System.out.println(System.currentTimeMillis()-currentTimeMillis);
		
		model.addAttribute("page", page);
		model.addAttribute("bankuaiid", bankuaiid);
		model.addAttribute("zhutiid", zhutiid);
		model.addAttribute("orderby", orderby);
		model.addAttribute("bankuai", bankuai);
		model.addAttribute("zhutilist", zhutilist);
		model.addAttribute("nowcount", nowcount);
		model.addAttribute("zhidinglist", zhidinglist);
		return "jsp/index/bankuai";
	}
	
}
