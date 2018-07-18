package cc.javaee.bbs.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.javaee.bbs.model.Bankuai;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.Zhuti;
import cc.javaee.bbs.service.ZhutiService;
/*
 * 后台主题管理
 * 
 */
@Controller
@RequestMapping("/admin/zhuti")
public class AdminZhutiController {
	@Autowired
	ZhutiService zhutiService;

	private static Logger log = Logger.getLogger(AdminZhutiController.class);

	//后台页面查询
	@RequestMapping("index.do")
	public String findAllWhere(HttpServletRequest request, Model model,Zhuti zhuti,PageBean<Bankuai> page) {
		List<Zhuti> list = zhutiService.find(zhuti);
		model.addAttribute("list", list);
		model.addAttribute("bankuaiId", zhuti.getBankuaiId());
		return "jsp/admin/zhuti/index";
	}
	
	//跳转到修改页面
	@RequestMapping("toupdateoradd.do")
	public String toupdateoradd(Zhuti zhuti, Model model) {
		if(zhuti.getId()!=null){
			zhuti=zhutiService.findbyid(zhuti);
		}
		model.addAttribute("zhuti", zhuti);
		return "jsp/admin/zhuti/updateoradd";
	}
	//修改或者新增
	@RequestMapping("updateoradd.do")
	public String updateoradd(Zhuti zhuti) {
		if(zhuti.getId()!=null){
			zhutiService.update(zhuti);
		}else{
			zhutiService.insert(zhuti);
		}
		return "redirect:index.do?bankuaiId="+zhuti.getBankuaiId();
	}
	//删除
	@ResponseBody
	@RequestMapping("del.do")
	public String del(int id) {
		String result=zhutiService.delete(id);
		return result;
	}
	
	
}
