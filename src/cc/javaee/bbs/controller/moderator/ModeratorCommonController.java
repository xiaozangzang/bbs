package cc.javaee.bbs.controller.moderator;

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

import com.google.gson.Gson;

import cc.javaee.bbs.model.Bankuai;
import cc.javaee.bbs.model.Jifen;
import cc.javaee.bbs.model.Tiezi;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.model.Zhuti;
import cc.javaee.bbs.model.Ztree;
import cc.javaee.bbs.service.BankuaiService;
import cc.javaee.bbs.service.HuifuService;
import cc.javaee.bbs.service.JifenService;
import cc.javaee.bbs.service.TieziService;
import cc.javaee.bbs.service.ZhutiService;
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;
import cc.javaee.bbs.tool.thread.IndexThread;
/*
 * 版主的操作
 * 
 */
@Controller
@RequestMapping("/moderator/common")
public class ModeratorCommonController {
	
	@Autowired
	TieziService tieziService;

	@Autowired
	HuifuService huifuService;
	@Autowired
	JifenService jifenService;
	
	@Autowired
	BankuaiService bankuaiService;
	
	@Autowired
	ZhutiService zhutiService;
	
	private static Logger log = Logger.getLogger(ModeratorCommonController.class);

	//设置精华
	@ResponseBody
	@RequestMapping("shezhijinghua.do")
	public Map<String, String> shezhijinghua(HttpServletRequest request,int id,String jinghua) {
		Map<String, String> map=new HashMap<String, String>();
		Tiezi tiezi=new Tiezi();
		tiezi.setId(id);
		tiezi.setJinghua(jinghua);
		User user=(User) request.getSession().getAttribute(PublicStatic.USER);
		tiezi.setLastupdate(""+user.getGroupname()+"\""+user.getLoginname()+"\"于"+Tool.getyyyyMMddHHmmss()+"将帖子设置精华"+jinghua+"</br>");
		tieziService.update(tiezi);
		
		tiezi = tieziService.findbyid(tiezi);
		
		Jifen jifen=new Jifen();
		jifen.setFenshu(PublicStatic.JIFEN_JINGHUA);
		jifen.setUserid(tiezi.getCreateuserid());
		jifen.setType("103");
		jifen.setOperateuserid(user.getId());
		jifen.setContent("您的帖子被设置为精华获得"+PublicStatic.JIFEN_JINGHUA+"积分");
		jifenService.insert(jifen);
		map.put("flag", "1");
		return map;
	}
	//取消设置精华
	@ResponseBody
	@RequestMapping("qxshezhijinghua.do")
	public Map<String, String> qxshezhijinghua(HttpServletRequest request,int id) {
		Map<String, String> map=new HashMap<String, String>();
		Tiezi tiezi=new Tiezi();
		tiezi.setId(id);
		tiezi.setJinghua("");
		User user=(User) request.getSession().getAttribute(PublicStatic.USER);
		tiezi.setLastupdate(""+user.getGroupname()+"\""+user.getLoginname()+"\"于"+Tool.getyyyyMMddHHmmss()+"将帖子取消精华"+"</br>");
		tieziService.update(tiezi);
		map.put("flag", "1");
		return map;
	}
	
	//板块置顶
	@ResponseBody
	@RequestMapping("updatebankuaizhiding.do")
	public Map<String, String> updateallzhiding(HttpServletRequest request,int id) {
		Map<String, String> map=new HashMap<String, String>();
		Tiezi tiezi=new Tiezi();
		tiezi.setId(id);
		tiezi.setZhiding(PublicStatic.BANKUAIZHIDING);
		User user=(User) request.getSession().getAttribute(PublicStatic.USER);
		tiezi.setLastupdate(""+user.getGroupname()+"\""+user.getLoginname()+"\"于"+Tool.getyyyyMMddHHmmss()+"将帖子板块置顶"+"</br>");
		tieziService.update(tiezi);
		map.put("flag", "1");
		return map;
	}
	//取消板块置顶
	@ResponseBody
	@RequestMapping("updatebankuaiqxzhiding.do")
	public Map<String, String> updateallqxzhiding(HttpServletRequest request,int id) {
		Map<String, String> map=new HashMap<String, String>();
		Tiezi tiezi=new Tiezi();
		tiezi.setId(id);
		tiezi.setZhiding("");
		User user=(User) request.getSession().getAttribute(PublicStatic.USER);
		tiezi.setLastupdate(""+user.getGroupname()+"\""+user.getLoginname()+"\"于"+Tool.getyyyyMMddHHmmss()+"将帖子取消板块置顶"+"</br>");
		tieziService.update(tiezi);
		map.put("flag", "1");
		return map;
	}
	
	//删除帖子
	@ResponseBody
	@RequestMapping("deltiezi.do")
	public Map<String, String> deltiezi(HttpServletRequest request,int id) {
		Map<String, String> map=new HashMap<String, String>();
		tieziService.delete(id);
		huifuService.delete(id);
		map.put("flag", "1");
		//启动缓存线程
		new IndexThread().start();
		return map;
	}
	//删除回复
	@ResponseBody
	@RequestMapping("delhuifu.do")
	public Map<String, String> delhuifu(HttpServletRequest request,int id) {
		Map<String, String> map=new HashMap<String, String>();
		huifuService.updatedelete(id);
		map.put("flag", "1");
		//启动缓存线程
		new IndexThread().start();
		return map;
	}
	
	//跳转移动树
	@RequestMapping("ztreeyidong.do")
	public String toindex(Model model,int id) {
		//查询板块列表
		List<Bankuai> bankuaiList = bankuaiService.find(null);
		//查询主题列表
		List<Zhuti> zhutiList = zhutiService.find(null);
		//查询帖子所在主题
		Tiezi tiezi=new Tiezi();
		tiezi.setId(id);
		tiezi = tieziService.findbytieziwhere(tiezi);
		//记录帖子的主题id
		int zhutiid=Integer.parseInt(tiezi.getZhutiid());
		//记录帖子的板块id
		int bankuaiid=tiezi.getBankuaiId();
		//记录帖子的父板块id
		int pbankuaiid=0;
		List<Ztree> list=new ArrayList<Ztree>();
		//循环主题
		for (int i = 0; i < zhutiList.size(); i++) {
			Zhuti zhuti = zhutiList.get(i);
			Ztree ztree=new Ztree();
			ztree.setId(zhuti.getId());
			ztree.setpId(zhuti.getBankuaiId());
			ztree.setName(zhuti.getName());
			ztree.setOpen(false);
			ztree.setNocheck(false);
			if(zhuti.getId()==zhutiid){
				ztree.setChecked(true);
			}else{
				ztree.setChecked(false);
			}
			list.add(ztree);
		}
		//循环子板块
		for (int i = 0; i < bankuaiList.size(); i++) {
			Bankuai bankuai = bankuaiList.get(i);
			if(bankuai.getParentId()!=0){
				Ztree ztree=new Ztree();
				ztree.setId(bankuai.getId());
				ztree.setpId(bankuai.getParentId());
				ztree.setName(bankuai.getName());
				if(bankuai.getId()==bankuaiid){
					ztree.setOpen(true);
					pbankuaiid=bankuai.getParentId();
				}else{
					ztree.setOpen(false);
				}
				ztree.setNocheck(true);
				list.add(ztree);
			}
		}//循环父板块
		for (int i = 0; i < bankuaiList.size(); i++) {
			Bankuai bankuai = bankuaiList.get(i);
			if(bankuai.getParentId()==0){
				Ztree ztree=new Ztree();
				ztree.setId(bankuai.getId());
				ztree.setpId(bankuai.getParentId());
				ztree.setName(bankuai.getName());
				if(bankuai.getId()==pbankuaiid){
					ztree.setOpen(true);
				}else{
					ztree.setOpen(false);
				}
				ztree.setNocheck(true);
				list.add(ztree);
			}
		}
		model.addAttribute("zNodes", new Gson().toJson(list));
		model.addAttribute("tieziid", id);
		return "jsp/index/user/ztreeyidong";
	}
	
	//移动板块根据主题移动
	@ResponseBody
	@RequestMapping("updatebankuai.do")
	public Map<String, String> updatebankuai(HttpServletRequest request,int tieziid,int zhutiid) {
		Map<String, String> map=new HashMap<String, String>();
		User user=(User) request.getSession().getAttribute(PublicStatic.USER);
		
		//查询帖子所在板块
		Tiezi tiezisql=new Tiezi();
		tiezisql.setId(tieziid);
		tiezisql = tieziService.findbytieziwhere(tiezisql);
		
		//查询主题的板块名称和id
		Zhuti zhuti=new Zhuti();
		zhuti.setId(zhutiid);
		zhuti = zhutiService.findbyid(zhuti);
		//更新帖子
		Tiezi tiezi=new Tiezi();
		tiezi.setBankuaiId(zhuti.getBankuaiId());
		tiezi.setZhutiid(zhuti.getId()+"");
		tiezi.setId(tieziid);
		tiezi.setLastupdate(""+user.getGroupname()+"\""+user.getLoginname()+"\"于"+Tool.getyyyyMMddHHmmss()+"将帖子从“"+tiezisql.getBankuainame()+"”板块“"+tiezisql.getZhutiname()+"”主题移动到“"+zhuti.getBankuainame()+"”板块“"+zhuti.getName()+"”主题"+"</br>");
		tieziService.update(tiezi);
		map.put("flag", "1");
		return map;
	}
	
	
	
}
