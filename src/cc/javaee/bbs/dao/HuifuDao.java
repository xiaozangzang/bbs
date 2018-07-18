package cc.javaee.bbs.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cc.javaee.bbs.model.Huifu;
import cc.javaee.bbs.model.PageBean;
@Repository
public class HuifuDao extends SqlSessionDaoSupport{
	String ns="jbbs_huifu.";
	public List<Map<String, Object>> findpage(PageBean<Map<String, Object>> page) {
		return this.getSqlSession().selectList(ns+"findpage", page);
	}
	public int findpagecount(PageBean<Map<String, Object>> page) {
		return this.getSqlSession().selectOne(ns+"findpagecount", page);
	}
	
	public List<Huifu> find(Huifu Huifu) {
		return this.getSqlSession().selectList(ns+"find", Huifu);
	}

	public void insert(Huifu Huifu) {
		this.getSqlSession().insert(ns+"insert", Huifu);
	}

	public void delete(Integer id) {
		this.getSqlSession().delete(ns+"delete", id);
	}

	public void update(Huifu Huifu) {
		this.getSqlSession().update(ns+"update", Huifu);
	}
	public Integer maxobderby(int id) {
		return this.getSqlSession().selectOne(ns+"maxobderby", id);
	}
	public void updatedelete(int id) {
		Huifu huifu=new Huifu();
		huifu.setId(id);
		huifu.setIsdel("1");
		this.getSqlSession().update(ns+"update", huifu);
	}

}