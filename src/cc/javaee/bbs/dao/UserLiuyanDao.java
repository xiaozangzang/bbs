package cc.javaee.bbs.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cc.javaee.bbs.model.UserLiuyan;
@Repository
public class UserLiuyanDao extends SqlSessionDaoSupport{
	String ns="jbbs_user_liuyan.";
	
	public List<UserLiuyan> find(UserLiuyan UserLiuyan) {
		return this.getSqlSession().selectList(ns+"find", UserLiuyan);
	}

	public void insert(UserLiuyan UserLiuyan) {
		this.getSqlSession().insert(ns+"insert", UserLiuyan);
	}

	public void delete(Integer id) {
		this.getSqlSession().delete(ns+"delete", id);
	}

	public void update(UserLiuyan UserLiuyan) {
		this.getSqlSession().update(ns+"update", UserLiuyan);
	}

	public List<Map<String, Object>> findByObject(UserLiuyan userLiuyan) {
		return this.getSqlSession().selectList(ns+"findByObject", userLiuyan);
	}

}