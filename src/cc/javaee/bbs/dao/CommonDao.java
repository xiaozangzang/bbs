package cc.javaee.bbs.dao;


import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;
@Repository
public class CommonDao extends SqlSessionDaoSupport{
	String ns="jbbs_common.";
	
	public void indextongji() {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("nowdate", Tool.getyyyy_MM_dd());
		map.put("qnowdate", Tool.getq_yyyy_MM_dd());
		PublicStatic.indexmap=this.getSqlSession().selectOne(ns+"indextongji", map);
	}
	
	//查询最新帖子放入缓存数据
	public void ztiezi() {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("zdate", Tool.getqy_yyyy_MM_dd());
		PublicStatic.ztiezi= this.getSqlSession().selectList(ns+"ztiezi", map);
	}

}