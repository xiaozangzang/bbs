package cc.javaee.bbs.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.Tiezi;
@Repository
public class TieziDao extends SqlSessionDaoSupport{
	String ns="jbbs_tiezi.";
	public List<Tiezi> findpage(PageBean<Tiezi> page) {
		return this.getSqlSession().selectList(ns+"findpage", page);
	}
	
	public int findpagecount(PageBean<Tiezi> page) {
		return this.getSqlSession().selectOne(ns+"findpagecount", page);
	}
	
	public List<Tiezi> find(Tiezi tiezi) {
		return this.getSqlSession().selectList(ns+"find", tiezi);
	}

	public void insert(Tiezi tiezi) {
		this.getSqlSession().insert(ns+"insert", tiezi);
	}

	public void delete(Integer id) {
		this.getSqlSession().delete(ns+"delete", id);
	}

	public void update(Tiezi tiezi) {
		this.getSqlSession().update(ns+"update", tiezi);
	}

	public int findnowcount(Tiezi tiezi) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(ns+"findnowcount", tiezi);
	}
	
	public Map<String, Object> findbytieziid(Tiezi tiezi) {
		return this.getSqlSession().selectOne(ns+"findbytiezi", tiezi);
	}

	//更新查看次数
	public void updatefindcount(int id) {
		this.getSqlSession().update(ns+"updatefindcount", id);
	}
	//更新最后回复id，此更新比较慢
	public void updatetiezilasthuifuid() {
		this.getSqlSession().update(ns+"updatetiezilasthuifuid");
	}
	
	public Tiezi findbytieziwhere(Tiezi tiezi){
		return this.getSqlSession().selectOne(ns+"findbytieziwhere", tiezi);
	}

}