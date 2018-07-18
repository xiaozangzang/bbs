package cc.javaee.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.javaee.bbs.dao.LinkDao;
import cc.javaee.bbs.model.Link;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.tool.Tool;

@Service
public class LinkService{
	@Autowired
	LinkDao LinkDao;
	
	public PageBean<Link> findpage(Link Link,PageBean<Link> page) {
		page.setBean(Link);
		int count = LinkDao.findpagecount(page);
		page.setTotalRecords(count);
		List<Link> list = LinkDao.findpage(page);
		page.setList(list);
		return page ;
	}
	

	public void insert(Link Link) {
		Link.setCreatetime(Tool.getyyyyMMddHHmmss());
		Link.setBankuaiid(0);
		Link.setType("0");
		Link.setIsshow("1");
		//自动排序
		if(Link.getOrderby()!=null&&!"".equals(Link.getOrderby())){
			
		}else{
			int findmaxorderby = LinkDao.findmaxorderby();
			Link.setOrderby(findmaxorderby);
		}
		//自动加入http://
		String link2 = Link.getLink();
		if(link2!=null&&!link2.startsWith("http://")&&!link2.startsWith("https://")){
			link2="http://"+link2;
			Link.setLink(link2);
		}
		LinkDao.insert(Link);
	}

	public String delete(Integer id) {
		String result="1";
		LinkDao.delete(id);
		return result;
	}
	public void update(Link Link) {
		//自动加入http://
		String link2 = Link.getLink();
		if(link2!=null&&(!link2.startsWith("http://")&&!link2.startsWith("https://"))){
			link2="http://"+link2;
			Link.setLink(link2);
		}
		LinkDao.update(Link);
		
	}
	public Link findbyid(Link Link) {
		List<Link> list= LinkDao.find(Link);
		if(list.size()>0){
			Link=list.get(0);
		}
		return Link;
	}
	
	public List<Link> find(Link Link) {
		return LinkDao.find(Link);
	}



}
