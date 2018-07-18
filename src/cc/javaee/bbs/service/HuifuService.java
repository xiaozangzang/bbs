package cc.javaee.bbs.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.javaee.bbs.dao.HuifuDao;
import cc.javaee.bbs.model.Huifu;
import cc.javaee.bbs.model.PageBean;

@Service
public class HuifuService{
	@Autowired
	HuifuDao HuifuDao;
	
	public PageBean<Map<String, Object>> findpage(Map<String, Object> map,PageBean<Map<String, Object>> page) {
		page.setBean(map);
		int count = HuifuDao.findpagecount(page);
		page.setTotalRecords(count);
		List<Map<String, Object>> list = HuifuDao.findpage(page);
		for (Map<String, Object> map2 : list) {
			//如果恢复被删除，替换回复内容
			String isdel=map2.get("isdel")+"";
			if("1".equals(isdel)){
				map2.put("contenthtml", "<div class=\"pct\"><div class=\"pcb\"><div class=\"locked\">提示: <em>该作者的回复内容被删除屏蔽</em></div></div></div>");
				map2.put("contenttxt", "作者被禁止或删除 内容自动屏蔽");
			}
			String pisdel=map2.get("pisdel")+"";
			if("1".equals(pisdel)){
				map2.put("pcontenthtml", "<div class=\"pct\"><div class=\"pcb\"><div class=\"locked\">提示: <em>该作者的回复内容被删除屏蔽</em></div></div></div>");
				map2.put("pcontenttxt", "作者被禁止或删除 内容自动屏蔽");
			}
		}
		
		page.setList(list);
		return page ;
	}
	

	public void insert(Huifu Huifu) {
		HuifuDao.insert(Huifu);
	}

	public String delete(Integer id) {
		String result="1";
		HuifuDao.delete(id);
		return result;
	}
	public Huifu findbyid(Huifu Huifu) {
		List<Huifu> list= HuifuDao.find(Huifu);
		if(list.size()>0){
			Huifu=list.get(0);
		}
		return Huifu;
	}
	
	public List<Huifu> findbyparentId(Huifu Huifu) {
		List<Huifu> list= HuifuDao.find(Huifu);
		return list;
	}


	public List<Huifu> find(Huifu Huifu) {
		return HuifuDao.find(Huifu);
	}


	public Integer maxobderby(int id) {
		
		return HuifuDao.maxobderby(id);
	}


	public void updatedelete(int id) {
		HuifuDao.updatedelete(id);
	}



}
