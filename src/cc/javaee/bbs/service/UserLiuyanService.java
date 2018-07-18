package cc.javaee.bbs.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.javaee.bbs.dao.UserLiuyanDao;
import cc.javaee.bbs.model.UserLiuyan;

@Service
public class UserLiuyanService{
	@Autowired
	UserLiuyanDao UserLiuyanDao;
	

	public void insert(UserLiuyan UserLiuyan) {
		UserLiuyanDao.insert(UserLiuyan);
	}

	public String delete(Integer id) {
		String result="1";
		UserLiuyanDao.delete(id);
		return result;
	}
	public void update(UserLiuyan UserLiuyan) {
		UserLiuyanDao.update(UserLiuyan);
		
	}
	public UserLiuyan findbyid(UserLiuyan UserLiuyan) {
		List<UserLiuyan> list= UserLiuyanDao.find(UserLiuyan);
		if(list.size()>0){
			UserLiuyan=list.get(0);
		}
		return UserLiuyan;
	}

	public List<Map<String, Object>> find(int id) {
		UserLiuyan userLiuyan=new UserLiuyan();
		userLiuyan.setLiuyanuserid(id);
		return UserLiuyanDao.findByObject(userLiuyan);
	}
}
