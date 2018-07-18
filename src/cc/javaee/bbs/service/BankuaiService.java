package cc.javaee.bbs.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.javaee.bbs.dao.BankuaiDao;
import cc.javaee.bbs.model.Bankuai;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.tool.Tool;

@Service
public class BankuaiService{
	@Autowired
	BankuaiDao bankuaiDao;
	
	public PageBean<Bankuai> findpage(Bankuai bankuai,PageBean<Bankuai> page) {
		page.setBean(bankuai);
		int count = bankuaiDao.findpagecount(page);
		page.setTotalRecords(count);
		List<Bankuai> list = bankuaiDao.findpage(page);
		page.setList(list);
		return page ;
	}
	

	public void insert(Bankuai bankuai) {
		if(bankuai.getOrderBy()==null){
			int maxorderby= bankuaiDao.findmaxorderby(0);
			bankuai.setOrderBy(maxorderby+1);
		}
		bankuai.setCreateTime(Tool.getyyyyMMddHHmmss());
		bankuaiDao.insert(bankuai);
	}

	public String delete(Integer id) {
		String result="1";
		Bankuai bankuai=new Bankuai();
		bankuai.setParentId(id);
		List<Bankuai> list = bankuaiDao.find(bankuai);
		if(list.size()>0){
			result="0";
		}else{
			bankuaiDao.delete(id);
		}
		return result;
	}
	public void update(Bankuai bankuai) {
		if(bankuai.getOrderBy()==null){
			int maxorderby= bankuaiDao.findmaxorderby(0);
			bankuai.setOrderBy(maxorderby+1);
		}
		bankuaiDao.update(bankuai);
		
	}
	public Bankuai findbyid(Bankuai bankuai) {
		List<Bankuai> list= bankuaiDao.find(bankuai);
		if(list.size()>0){
			bankuai=list.get(0);
		}
		return bankuai;
	}
	
	public List<Bankuai> findbyparentId(Bankuai bankuai) {
		bankuai.setParentId(0);
		List<Bankuai> list= bankuaiDao.find(bankuai);
		return list;
	}


	public List<Bankuai> find(Bankuai bankuai) {
		// TODO Auto-generated method stub
		return bankuaiDao.find(bankuai);
	}


	public Bankuai findbyid(String bankuaiid) {
		List<Bankuai> list=new ArrayList<Bankuai>();
//		Bankuai bankuai=new Bankuai();
//		bankuai.setId(Integer.parseInt(bankuaiid));
//		List<Bankuai> find = bankuaiDao.find(bankuai);
//		if(find.size()>0){
//			list.add(find.get(0));
//			Integer parentId = find.get(0).getParentId();
//			if(0!=parentId){
//				bankuai=new Bankuai();
//				bankuai.setId(parentId);
//				find = bankuaiDao.find(bankuai);
//				if(find.size()>0){
//					list.add(0,find.get(0));
//				}
//			}
//		}
		
		Bankuai bankuai=bankuaiDao.findfbankuaibyid(Integer.parseInt(bankuaiid));
		return bankuai;
	}

}
