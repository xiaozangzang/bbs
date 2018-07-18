package cc.javaee.bbs.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import cc.javaee.bbs.model.Gonggao;

@Repository
public class GonggaoDao extends SqlSessionDaoSupport{
	String ns="jbbs_gonggao.";
	public List<Gonggao> find(Gonggao gonggao) {
		return this.getSqlSession().selectList(ns+"find", gonggao);
	}

	public void update(Gonggao gonggao) {
		this.getSqlSession().update(ns+"update", gonggao);
	}


}
