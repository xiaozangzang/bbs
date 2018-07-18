package cc.javaee.bbs.dao;


import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cc.javaee.bbs.model.Group;
import cc.javaee.bbs.model.GroupUser;
import cc.javaee.bbs.model.PageBean;
@Repository
public class GroupDao extends SqlSessionDaoSupport{
	String ns="jbbs_group.";
	public List<Group> findpage(PageBean<Group> page) {
		return this.getSqlSession().selectList(ns+"findpage", page);
	}
	public int findpagecount(PageBean<Group> page) {
		return this.getSqlSession().selectOne(ns+"findpagecount", page);
	}
	
	public List<Group> find(Group Group) {
		return this.getSqlSession().selectList(ns+"find", Group);
	}

	public void insert(Group Group) {
		this.getSqlSession().insert(ns+"insert", Group);
	}

	public void delete(Integer id) {
		this.getSqlSession().delete(ns+"delete", id);
	}

	public void update(Group Group) {
		this.getSqlSession().update(ns+"update", Group);
	}
	public void delgroupbyuser(int userid) {
		this.getSqlSession().delete(ns+"delgroupbyuser", userid);
	}
	public void insertgroupUser(GroupUser groupUser) {
		this.getSqlSession().insert(ns+"insertgroupUser", groupUser);
	}

}