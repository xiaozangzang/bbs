package cc.javaee.bbs.tool;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationObjectSupport;

public class ToolSpring extends WebApplicationObjectSupport {
	private static ApplicationContext applicationContext = null;

	@Override
	protected void initApplicationContext(ApplicationContext context) {
		super.initApplicationContext(context);
		if (applicationContext == null) {
			applicationContext = context;
		}
	}

	public static ApplicationContext getAppContext() {
		return applicationContext;
	}

	public static Object getBean(String name) {
		return applicationContext.getBean(name);
	}

}
