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
import cc.javaee.bbs.model.JifenGroup;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.service.BankuaiService;
import cc.javaee.bbs.service.JifenGroupService;
import cc.javaee.bbs.tool.PublicStatic;
/*
 * 后台板块查询
 * 
 */
@Controller
@RequestMapping("/admin/bankuai")
public class AdminBankuaiController {
	@Autowired
	BankuaiService bankuaiService;
	
	@Autowired
	JifenGroupService jifenGroupService;

	private static Logger log = Logger.getLogger(AdminBankuaiController.class);

	//后台页面查询
	@RequestMapping("index.do")
	public String findAllWhere(HttpServletRequest request, Model model,Bankuai bankuai,PageBean<Bankuai> page) {
		page = bankuaiService.findpage(bankuai,page);
		model.addAttribute("page", page);
		return "jsp/admin/bankuai/index";
	}
	
	//跳转到修改页面
	@RequestMapping("toupdateoradd.do")
	public String toupdateoradd(Bankuai bankuai, Model model) {
		if(bankuai.getId()!=null){
			bankuai=bankuaiService.findbyid(bankuai);
		}
		model.addAttribute("bankuai", bankuai);
		List<Bankuai> parentList = bankuaiService.findbyparentId(new Bankuai());
		//如果是父板块，删除自己
		for (int i=0;i< parentList.size() ;i++) {
			Bankuai bankuai2=parentList.get(i);
			if(bankuai2.getId()==bankuai.getId()){
				parentList.remove(bankuai2);
			}
		}
		model.addAttribute("parentList", parentList);
		List<JifenGroup> jifengouplist = jifenGroupService.find(new JifenGroup());
		model.addAttribute("jifengouplist", jifengouplist);
		return "jsp/admin/bankuai/updateoradd";
	}
	//修改或者新增
	@RequestMapping("updateoradd.do")
	public String updateoradd(HttpServletRequest request,Bankuai bankuai) {
		User user=(User)request.getSession().getAttribute(PublicStatic.USER);
		bankuai.setCreateUserid(user.getId());
		String img = bankuai.getImg();
		if(img!=null&&img.length()==0){
			bankuai.setImg("bankuai.jpg");
		}
		if(bankuai.getId()!=null){
			bankuaiService.update(bankuai);
		}else{
			bankuaiService.insert(bankuai);
		}
		return "redirect:index.do ";
	}
	//删除
	@ResponseBody
	@RequestMapping("del.do")
	public String del(int id) {
		String result=bankuaiService.delete(id);
		return result;
	}
	
	
}
