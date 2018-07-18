package cc.javaee.bbs.dao;


import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cc.javaee.bbs.model.Jifen;
import cc.javaee.bbs.model.PageBean;
@Repository
public class JifenDao extends SqlSessionDaoSupport{
	String ns="jbbs_jifen.";
	public List<Jifen> findpage(PageBean<Jifen> page) {
		return this.getSqlSession().selectList(ns+"findpage", page);
	}
	public int findpagecount(PageBean<Jifen> page) {
		return this.getSqlSession().selectOne(ns+"findpagecount", page);
	}
	public int findnowcount(Jifen jifen) {
		return this.getSqlSession().selectOne(ns+"findnowcount", jifen);
	}
	
	public List<Jifen> find(Jifen Jifen) {
		return this.getSqlSession().selectList(ns+"find", Jifen);
	}

	public void insert(Jifen Jifen) {
		this.getSqlSession().insert(ns+"insert", Jifen);
	}

	public void delete(Integer id) {
		this.getSqlSession().delete(ns+"delete", id);
	}

	public void update(Jifen Jifen) {
		this.getSqlSession().update(ns+"update", Jifen);
	}
}