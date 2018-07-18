package cc.javaee.bbs.tool.thread;

import org.apache.log4j.Logger;

import cc.javaee.bbs.service.CommonService;
import cc.javaee.bbs.tool.ToolSpring;

public class IndexThread  extends Thread{
	
	private static Logger log = Logger.getLogger(IndexThread.class);
	
	CommonService commonService=(CommonService) ToolSpring.getBean("commonService");
	
	@Override
	public void run() {
		//缓存数据和更新数据-暂时调用位置有 新增帖子，删除帖子 新增回复  删除回复
		long start=System.currentTimeMillis();
		commonService.ztiezi();
		log.info("执行耗时:"+(System.currentTimeMillis()-start));
	}
}
