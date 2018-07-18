package cc.javaee.bbs.tool;

import org.apache.log4j.Logger;

import cc.javaee.bbs.service.CommonService;

//定时任务缓存使用--暂时不用了
public class JAVAEEThread extends Thread{

	private static Logger log = Logger.getLogger(JAVAEEThread.class);
	CommonService commonService=(CommonService) ToolSpring.getBean("commonService");
	
	
	@Override
	public void run() {
		while (true) {
			//定时缓存数据和更新数据
			long start=System.currentTimeMillis();
			commonService.ztiezi();
			log.info("定时执行耗时:"+(System.currentTimeMillis()-start));
			try {
				sleep(1000*30);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
