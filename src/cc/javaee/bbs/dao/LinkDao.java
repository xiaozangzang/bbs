package cc.javaee.bbs.dao;


import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cc.javaee.bbs.model.Link;
import cc.javaee.bbs.model.PageBean;
@Repository
public class LinkDao extends SqlSessionDaoSupport{
	String ns="jbbs_link.";
	public List<Link> findpage(PageBean<Link> page) {
		return this.getSqlSession().selectList(ns+"findpage", page);
	}
	public int findpagecount(PageBean<Link> page) {
		return this.getSqlSession().selectOne(ns+"findpagecount", page);
	}
	public int findmaxorderby() {
		return this.getSqlSession().selectOne(ns+"findmaxorderby");
	}
	
	public List<Link> find(Link Link) {
		return this.getSqlSession().selectList(ns+"find", Link);
	}

	public void insert(Link Link) {
		this.getSqlSession().insert(ns+"insert", Link);
	}

	public void delete(Integer id) {
		this.getSqlSession().delete(ns+"delete", id);
	}

	public void update(Link Link) {
		this.getSqlSession().update(ns+"update", Link);
	}

}