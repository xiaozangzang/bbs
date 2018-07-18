package cc.javaee.bbs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.javaee.bbs.dao.TieziDao;
import cc.javaee.bbs.model.Bankuai;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.Tiezi;
import cc.javaee.bbs.tool.Tool;

@Service("tieziService")
public class TieziService{
	@Autowired
	TieziDao tieziDao;
	
	public PageBean<Tiezi> findpage(Tiezi tiezi,PageBean<Tiezi> page) {
		page.setBean(tiezi);
		int count = tieziDao.findpagecount(page);
		page.setTotalRecords(count);
		List<Tiezi> list = tieziDao.findpage(page);
		page.setList(list);
		return page ;
	}
	

	public void insert(Tiezi tiezi) {
		tiezi.setCreatetime(Tool.getyyyyMMddHHmmss());
//		String contenthtml = tiezi.getContenthtml();
//		contenthtml=contenthtml.replaceAll("white-space: nowrap;", "");
//		tiezi.setContenthtml(contenthtml);
		tieziDao.insert(tiezi);
	}

	public String delete(Integer id) {
		String result="1";
//		Bankuai bankuai=new Bankuai();
//		bankuai.setParentId(id);
//		List<Bankuai> list = tieziDao.find(bankuai);
//		if(list.size()>0){
//			result="0";
//		}else{
			tieziDao.delete(id);
//		}
		return result;
	}
	public void update(Tiezi tiezi) {
//		if(bankuai.getOrderBy()==null){
//			int maxorderby= tieziDao.findmaxorderby(0);
//			bankuai.setOrderBy(maxorderby+1);
//		}
		tieziDao.update(tiezi);
		
	}
	public Tiezi findbyid(Tiezi tiezi) {
		List<Tiezi> list= tieziDao.find(tiezi);
		if(list.size()>0){
			tiezi=list.get(0);
		}
		return tiezi;
	}
	
	public List<Tiezi> find(Tiezi tiezi) {
		return tieziDao.find(tiezi);
	}


	public PageBean<Tiezi> findpagebybankuanid(Tiezi tiezi,
			PageBean<Tiezi> page) {
		String orderby = tiezi.getOrderby();
		if("0".equals(orderby)){
			orderby=" t1.id  ";
		}else if("1".equals(orderby)){
			orderby=" t5.createtime ";
		}else if("2".equals(orderby)){
			orderby=" t1.jinghua ";
		}else{
			orderby=" t1.id ";
		}
		tiezi.setOrderby(orderby);
		page.setBean(tiezi);
		int count = tieziDao.findpagecount(page);
		page.setTotalRecords(count);
		List<Tiezi> list = tieziDao.findpage(page);
		page.setList(list);
		return page ;
	}


	public int findnowcount(String bankuaiid) {
		Tiezi tiezi=new Tiezi();
		tiezi.setBankuaiId(Integer.parseInt(bankuaiid));
		tiezi.setCreatetime(Tool.getyyyy_MM_dd());
		return tieziDao.findnowcount(tiezi);
	}


	public List<Tiezi> findzhiding(String bankuaiid) {
		Tiezi tiezi=new Tiezi();
		tiezi.setBankuaiId(Integer.parseInt(bankuaiid));
		List<Tiezi> find = tieziDao.find(tiezi);
		return find;
	}


	public Map<String, Object> findbytieziid(String id) {
		Map<String, Object> map=new HashMap<String, Object>();
		Tiezi tiezi=new Tiezi();
		tiezi.setId(Integer.parseInt(id));
		Map<String, Object> findbytieziid = tieziDao.findbytieziid(tiezi);
		String contenttxt=findbytieziid.get("contenttxt")+"";
		if(contenttxt!=null&&contenttxt.length()>200){
			//对页面描述(<meta name="description" content="${map.tiezi.contenttxt}" /> )的修改，截取并替换<>
			contenttxt=contenttxt.substring(0, 190)+"...";
			contenttxt=contenttxt.replaceAll("<", "");
			contenttxt=contenttxt.replaceAll(">", "");
			findbytieziid.put("contenttxt", contenttxt);
		}
		map.put("tiezi", findbytieziid);
		map.put("fatiegroup", findbytieziid.get("fatiegroup"));
		map.put("huifugroup", findbytieziid.get("huifugroup"));
		return map;
	}


	public void updatefindcount(int id) {
		tieziDao.updatefindcount(id);
	}
	
	
	public Tiezi findbytieziwhere(Tiezi tiezi){
		return tieziDao.findbytieziwhere(tiezi);
	}
}
