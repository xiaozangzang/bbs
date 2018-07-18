package cc.javaee.bbs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.javaee.bbs.dao.CommonDao;
import cc.javaee.bbs.dao.TieziDao;

@Service("commonService")
public class CommonService{
	@Autowired
	CommonDao commonDao;
	
	@Autowired
	TieziDao tieziDao;
	
	//查询最新帖子,查询后放入缓存
	public void ztiezi() {
		//首页统计
		commonDao.indextongji();
		//首页最新帖子列表
		commonDao.ztiezi();
		//更新最后发帖的回复id
		tieziDao.updatetiezilasthuifuid();
	}
	

}
