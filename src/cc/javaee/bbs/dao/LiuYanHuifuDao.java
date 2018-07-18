package cc.javaee.bbs.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cc.javaee.bbs.model.Huifu;
import cc.javaee.bbs.model.LiuYanHuifu;
import cc.javaee.bbs.model.PageBean;
@Repository
public class LiuYanHuifuDao extends SqlSessionDaoSupport{
	String ns="jbbs_liuyan_huifu.";
	public List<Map<String, Object>> findpage(PageBean<Map<String, Object>> page) {
		return this.getSqlSession().selectList(ns+"findpage", page);
	}
	public int findpagecount(PageBean<Map<String, Object>> page) {
		return this.getSqlSession().selectOne(ns+"findpagecount", page);
	}
	
	public List<LiuYanHuifu> find(LiuYanHuifu liuYanHuifu) {
		return this.getSqlSession().selectList(ns+"find", liuYanHuifu);
	}

	public void insert(LiuYanHuifu liuYanHuifu) {
		this.getSqlSession().insert(ns+"insert", liuYanHuifu);
	}

	public void delete(Integer id) {
		this.getSqlSession().delete(ns+"delete", id);
	}

	public void update(Huifu liuYanHuifu) {
		this.getSqlSession().update(ns+"update", liuYanHuifu);
	}
	public Integer maxobderby(int id) {
		return this.getSqlSession().selectOne(ns+"maxobderby", id);
	}
	public void updatedelete(int id) {
		LiuYanHuifu liuYanHuifu=new LiuYanHuifu();
		liuYanHuifu.setId(id);
		liuYanHuifu.setIsdel("1");
		this.getSqlSession().update(ns+"update", liuYanHuifu);
	}

}