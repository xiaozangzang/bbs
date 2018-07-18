package cc.javaee.bbs.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.javaee.bbs.dao.UserDao;
import cc.javaee.bbs.model.Bankuai;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;

@Service
public class UserService{
	@Autowired
	UserDao UserDao;
	
	public PageBean<User> findpage(User User,PageBean<User> page) {
		page.setBean(User);
		int count = UserDao.findpagecount(page);
		page.setTotalRecords(count);
		List<User> list = UserDao.findpage(page);
		page.setList(list);
		return page ;
	}
	

	public void insert(User User) {
		UserDao.insert(User);
	}

	public String delete(Integer id) {
		String result="1";
		UserDao.delete(id);
		return result;
	}
	public void update(User User) {
		UserDao.update(User);
		
	}
	public User findbyid(User User) {
		List<User> list= UserDao.find(User);
		if(list.size()>0){
			User=list.get(0);
		}
		return User;
	}
	
	public List<User> findbyparentId(User User) {
		List<User> list= UserDao.find(User);
		return list;
	}


	public List<User> find(User User) {
		// TODO Auto-generated method stub
		return UserDao.find(User);
	}


	public String isusername(String loginname) {
		String flag="1";
		User user=new User();
		user.setLoginname(loginname);
		List<User> list = UserDao.find(user);
		if(list.size()>0){
			flag="0";
		}
		return flag;
	}
	public String login(User user,HttpServletRequest request) {
		String flag="99";
		List<User> list = UserDao.find(user);
		if(list.size()>0){
			String pwd = user.getPwd();
			pwd=Tool.MD5(pwd);
			if(list.get(0).getPwd().equals(pwd)){
				flag=list.get(0).getFlag();
				if("1".equals(flag)){
					user=list.get(0);
					request.getSession().setAttribute(PublicStatic.USER, user);
					user.setLastlogintime(Tool.getyyyyMMddHHmmss());
					user.setLoginip(Tool.getIp(request));
					UserDao.update(user);
				}
			}else{
				flag="88";
			}
		}
		return flag;
	}
	
	public User findbyuserid(int id) {
		User user=new User();
		user.setId(id);
		List<User> list= UserDao.find(user);
		if(list.size()>0){
			user=list.get(0);
		}
		return user;
	}


	public String isfatie(String fatiegroup, User user) {
		Map<String, Object> userjifengroup=UserDao.userjifengroup(user);
		if(fatiegroup.equals("")||fatiegroup.contains("f"+userjifengroup.get("id")+",")){
			return "1";
		}else{
			return "0";
		}
	}
	
	public String ishuifu(String huifugroup, User user) {
		Map<String, Object> userjifengroup=UserDao.userjifengroup(user);
		if(huifugroup.equals("")||huifugroup.contains("h"+userjifengroup.get("id")+",")){
			return "1";
		}else{
			return "0";
		}
	}
	public Map<String, Object> findziliao( User user) {
		Map<String, Object> ziliao=UserDao.findziliao(user);
		return ziliao;
	}


	public void updateuseronlinetime(User user) {
		// TODO Auto-generated method stub
		UserDao.updateuseronlinetime(user);
	}
	
	
}
