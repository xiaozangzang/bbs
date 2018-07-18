package cc.javaee.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.javaee.bbs.dao.GonggaoDao;
import cc.javaee.bbs.model.Gonggao;

@Service
public class GonggaoService{
	@Autowired
	GonggaoDao gonggaoDao;

	public void update(Gonggao gonggao) {
		gonggaoDao.update(gonggao);
	}
	
	public Gonggao find(Gonggao gonggao) {
		List<Gonggao> list= gonggaoDao.find(gonggao);
		if(list.size() > 0){
			gonggao=list.get(0);
		}
		return gonggao;
	}
}
