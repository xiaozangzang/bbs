package cc.javaee.bbs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.javaee.bbs.dao.InfoDao;
import cc.javaee.bbs.model.Info;

@Service("infoService")
public class InfoService{
	@Autowired
	InfoDao infoDao;
	
	public void update(Info info) {
		infoDao.update(info);
	}
	public Info find() {
		int id=1;
		return infoDao.find(id);
	}
	

}
