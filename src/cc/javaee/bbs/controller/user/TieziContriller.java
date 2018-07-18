package cc.javaee.bbs.controller.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.javaee.bbs.model.Bankuai;
import cc.javaee.bbs.model.Huifu;
import cc.javaee.bbs.model.Jifen;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.Tiezi;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.model.Zhuti;
import cc.javaee.bbs.service.BankuaiService;
import cc.javaee.bbs.service.HuifuService;
import cc.javaee.bbs.service.JifenService;
import cc.javaee.bbs.service.TieziService;
import cc.javaee.bbs.service.UserService;
import cc.javaee.bbs.service.ZhutiService;
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;
import cc.javaee.bbs.tool.thread.IndexThread;
/*
 * 发帖页面
 * 
 */
@Controller
@RequestMapping("/tz")
public class TieziContriller {
	
	@Autowired
	TieziService tieziService;
	
	@Autowired
	ZhutiService zhutiService;
	@Autowired
	BankuaiService bankuaiService;
	@Autowired
	HuifuService huifuService;
	@Autowired
	JifenService jifenService;
	@Autowired
	UserService userService;
	
	//跳转发帖页面
	@RequestMapping("toft.do")
	public String toft(HttpServletRequest request, Model model,String id,PageBean<Tiezi> page) {
		//查询板块信息
		Bankuai bankuai= bankuaiService.findbyid(id);
		User user=(User)request.getSession().getAttribute(PublicStatic.USER);
		String flag=userService.isfatie(bankuai.getFatiegroup(),user);
		if(!flag.equals("1")){
			return "redirect:/topage/quanxian.do";
		}
		//根据板块查询主题
		Zhuti zhuti=new Zhuti();
		zhuti.setBankuaiId(Integer.parseInt(id));
		List<Zhuti> zhutilist = zhutiService.find(zhuti);
		Tiezi tiezi=new Tiezi();
		tiezi.setBankuaiId(Integer.parseInt(id));
		page = tieziService.findpagebybankuanid(tiezi, page);
		//今日的帖子总数
		int nowcount=tieziService.findnowcount(id);
		model.addAttribute("zhutilist", zhutilist);
		model.addAttribute("bankuaiId", id);
		model.addAttribute("bankuai", bankuai);
		model.addAttribute("page", page);
		model.addAttribute("nowcount", nowcount);
		return "jsp/index/user/fatie";
	}
	
	
	//保存发帖数据
	@RequestMapping("add.do")
	public String add(HttpServletRequest request, Model model,Tiezi tiezi) {
		User sessionuser=(User)request.getSession().getAttribute(PublicStatic.USER);
		Bankuai bankuai=new Bankuai();
		bankuai.setId(tiezi.getBankuaiId());
		bankuai= bankuaiService.findbyid(bankuai);		
		String flag=userService.isfatie(bankuai.getFatiegroup(),sessionuser);
		if(!flag.equals("1")){
			return "redirect:/topage/quanxian.do";
		}
		tiezi.setCreateuserid(sessionuser.getId());
		tiezi.setLastupdate("");
		tieziService.insert(tiezi);
		
		Jifen jifen=new Jifen();
		jifen.setFenshu(PublicStatic.JIFEN_FATIE);
		jifen.setUserid(sessionuser.getId());
		jifen.setType("101");
		jifen.setContent("您发布了帖子获得"+PublicStatic.JIFEN_FATIE+"积分");
		int findnowcount = jifenService.findnowcount(jifen);
		if(findnowcount<11){
			jifenService.insert(jifen);
		}
		//启动缓存线程
		new IndexThread().start();
		return "redirect:/bk/index.do?bankuaiid="+tiezi.getBankuaiId();
	}
	
	//跳转编辑发帖页面
	@RequestMapping("toupdate.do")
	public String toupdate(HttpServletRequest request, Model model,PageBean<Tiezi> page,String tieziid) {
		Tiezi tiezi=new Tiezi();
		tiezi.setId(Integer.parseInt(tieziid));
		tiezi = tieziService.findbytieziwhere(tiezi);
		String id=tiezi.getBankuaiId()+"";
		Bankuai bankuai= bankuaiService.findbyid(id);
		User user=(User)request.getSession().getAttribute(PublicStatic.USER);
		String flag=userService.isfatie(bankuai.getFatiegroup(),user);
		//判断是否有编辑权限
		if(Tool.isguanliyuan(user)){
			if(!flag.equals("1")){
				return "redirect:/topage/quanxian.do";
			}
		}
		Zhuti zhuti=new Zhuti();
		zhuti.setBankuaiId(Integer.parseInt(id));
		List<Zhuti> zhutilist = zhutiService.find(zhuti);
		page = tieziService.findpagebybankuanid(tiezi, page);
		//今日的帖子总数
		int nowcount=tieziService.findnowcount(id);
		model.addAttribute("zhutilist", zhutilist);
		model.addAttribute("bankuaiId", id);
		model.addAttribute("bankuai", bankuai);
		model.addAttribute("page", page);
		model.addAttribute("nowcount", nowcount);
		model.addAttribute("tiezi", tiezi);
		return "jsp/index/user/updatefatie";
	}
	
	//修改发帖数据
	@RequestMapping("update.do")
	public String update(HttpServletRequest request, Model model,Tiezi tiezi) {
		//
		Tiezi tiezisql = tieziService.findbytieziwhere(tiezi);
		
		User sessionuser=(User)request.getSession().getAttribute(PublicStatic.USER);
		if(Tool.isguanliyuan(sessionuser)){
			if(sessionuser.getId()!=tiezisql.getCreateuserid()){
				return "redirect:/topage/quanxian.do";
			}
		}
		//更新帖子信息，并记录操作日志
		Tiezi tieziupdate =new Tiezi();
		tieziupdate.setId(tiezi.getId());
		tieziupdate.setZhutiid(tiezi.getZhutiid());
		tieziupdate.setName(tiezi.getName());
		tieziupdate.setContenthtml(tiezi.getContenthtml());
		tieziupdate.setContenttxt(tiezi.getContenttxt());
		tieziupdate.setLastupdate("您的帖子在"+Tool.getyyyyMMddHHmmss()+"被"+sessionuser.getLoginname()+"编辑<br/>");
		tieziService.update(tieziupdate);
		return "redirect:/bk/index.do?bankuaiid="+tiezi.getBankuaiId();
	}
	
	
	//保存回复信息
	@ResponseBody
	@RequestMapping("addhuifu.do")
	public String addhuifu(HttpServletRequest request, Model model,int id,String editortxt,String editorhtml,Integer huifuid) {
		User sessionuser=(User)request.getSession().getAttribute(PublicStatic.USER);
		Map<String, Object> map= tieziService.findbytieziid(id+"");
		//验证是否有回复权限
		String flag = userService.ishuifu(map.get("huifugroup")+"", sessionuser);
		if(!flag.equals("1")){
			return flag;
		}
		Huifu huifu=new Huifu();
		huifu.setContenthtml(editorhtml);
		huifu.setContenttxt(editortxt);
		huifu.setCreateuserid(sessionuser.getId());
		huifu.setTieziid(id);
		huifu.setCreatetime(Tool.getyyyyMMddHHmmss());
		huifu.setIsdel("0");
		huifu.setHuifuid(huifuid);
		huifu.setOrderby(huifuService.maxobderby(id));
		huifuService.insert(huifu);
		//回复记录积分
		Jifen jifen=new Jifen();
		jifen.setFenshu(PublicStatic.JIFEN_HUIFU);
		jifen.setUserid(sessionuser.getId());
		jifen.setType("102");
		jifen.setContent("您回复了帖子获得"+PublicStatic.JIFEN_HUIFU+"积分");
		int findnowcount = jifenService.findnowcount(jifen);
		if(findnowcount<21){
			jifenService.insert(jifen);
		}
		//启动缓存线程
		new IndexThread().start();
		return "1";
	}
	
	//跳转编辑发帖页面
		@RequestMapping("toaddhuifu.do")
		public String toaddhuifu(HttpServletRequest request, Model model,int id,int huifuid) {
			model.addAttribute("id", id);
			model.addAttribute("huifuid", huifuid);
			return "jsp/index/user/addhuifu";
		}
	
	
}
