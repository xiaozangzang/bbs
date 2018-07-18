package cc.javaee.bbs.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import cc.javaee.bbs.controller.admin.AdminBankuaiController;
import cc.javaee.bbs.model.Info;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.service.InfoService;
import cc.javaee.bbs.tool.ConfigPropertiesUtil;
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.ToolSpring;
import cc.javaee.bbs.tool.thread.IndexThread;

/*
 * 伪静态使用
 * 
 */
public class CommonFilter implements Filter {
	private static Logger log = Logger.getLogger(AdminBankuaiController.class);

	public void destroy() {
		
	}

	/*
	 * 拦截所有访问
	 * 
	 */
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest) arg0;
		HttpServletResponse response=(HttpServletResponse) arg1;
		//判断是否需要登陆
		boolean islogin = islogin(request, response, chain);
		if(islogin){
			return;
		}
		String urlString=request.getRequestURI();
		int lastIndexOf = urlString.lastIndexOf(".")+1;
		if(PublicStatic.HTML.equals(urlString.substring(lastIndexOf, urlString.length()))){
			//静态化转换
			htmlfilter(request, response, chain, urlString);
		}else{
			String path=request.getServletPath();
			if(path.startsWith("/file/")){
				filefilter(request, response, chain, path);
			}else{
				chain.doFilter(request, response);
			}
		}
	}
	
	//展示附件
	public void filefilter(HttpServletRequest request, HttpServletResponse response,FilterChain chain,String path)throws IOException, ServletException{
		if(path.length() > 6){
			String parameter = path.substring(6, path.length());
			String[] split = parameter.split("/");
			if(split.length>0){
				String flag=split[0];
				String url="";
				if("video".equals(flag)){
					url="/download/downloadall.do?f="+parameter;
				}else if("file".equals(flag)){
					url="/download/downloadall.do?f="+parameter;
				}else{
					url="/download/downloadimg.do?f="+parameter;
				}
				request.getRequestDispatcher(url).forward(request, response);
				return;
			}
			
		}
	}	
	
	//判断是否登陆
	public boolean islogin(HttpServletRequest request, HttpServletResponse response,FilterChain chain)throws IOException, ServletException{
		String path = request.getServletPath();
//		System.out.println(path);
		if(request.getQueryString() != null){
			path += "?"+request.getQueryString();
		}
		List<String> list = new ArrayList<String>();
		list.add("/tz");
		list.add("/user");
		list.add("/admin");
		for (String string : list) {
			if(path.startsWith(string)){
				User user=(User) request.getSession().getAttribute(PublicStatic.USER);
				if(user != null){
					if(string.equals("/admin")){
						if(!user.getGroupid().equals(PublicStatic.GROUPADMIN)){
							response.sendRedirect(request.getContextPath()+"/");
							return true;
						}
					}
				}else{
					response.sendRedirect(request.getContextPath()+"/login/index.do?pathlocation="+request.getContextPath()+path);
					return true;
				}
			}
		}
		return false;
	}
		
	//静态化页面，转化controller访问
	public void htmlfilter(HttpServletRequest request, HttpServletResponse response,FilterChain chain,String urlString)throws IOException, ServletException{
		String url="";
		if(!"".equals(request.getContextPath())){
			urlString=urlString.replaceAll(request.getContextPath(), "");
		}
		urlString=urlString.substring(1, urlString.length());
		String[] urlsplit = urlString.split("/", -1);
		if(urlsplit.length==1){
			//首页父栏目拦截  /29.html
			String[] split=urlsplit[0].split("\\.", -1);
			if(split[1].equalsIgnoreCase(PublicStatic.HTML)){
				if(split[0].equals("baidu_verify_fDCbkFFyje")){
					url="/baidu_verify_fDCbkFFyje.html";
				}else{
					url="/index.do?parentId="+split[0];
				}
			}
		}else if(urlsplit.length==2){
			//板块 /bk/29_1_0_0.html
			if("bk".equals(urlsplit[0])){
				String[] split=urlsplit[1].split("\\.", -1);
				if(split[1].equalsIgnoreCase(PublicStatic.HTML)){
					split=split[0].split("_", -1);
					url="/bk/index.do?bankuaiid="+split[0]+"&pagestart="+split[1]+"&zhutiid="+split[2]+"&orderby="+split[3]+"";
				}
			}else if("tiezi".equals(urlsplit[0])){
				//内容  /tiezi/2_1.html
				String[] split=urlsplit[1].split("\\.", -1);
				if(split[1].equalsIgnoreCase(PublicStatic.HTML)){
					split=split[0].split("_", -1);
					url="/tiezi/index.do?id="+split[0]+"&pagestart="+split[1]+"&orderby="+split[2];
				}
			}else if("member".equals(urlsplit[0])){
				//个人资料  /member/2_1.html
				String[] split=urlsplit[1].split("\\.", -1);
				if(split[1].equalsIgnoreCase(PublicStatic.HTML)){
					split=split[0].split("_", -1);
					if(split.length==2){
						url="/member/index.do?id="+split[0]+"&flag="+split[1];
					}else{
						url="/member/index.do?id="+split[0]+"&flag="+split[1]+"&pagestart="+split[2];
					}
				}
			}else if("file".equals(urlsplit[0])){
				System.out.println(urlsplit[0]);
			}
		}
		
		if(!"".equals(url)){
			request.getRequestDispatcher(url).forward(request, response);
			return;
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		//获取上传文件路径
		String path = ConfigPropertiesUtil.getUpalodDir();
		if (path.equals("javaee")||"".equals(path)) {
			path = filterConfig.getServletContext().getRealPath("/");
		}
		path += "upload/";
		PublicStatic.FILE_PATH=path;
		InfoService infoService=(InfoService) ToolSpring.getBean("infoService");
		Info info = infoService.find();
		filterConfig.getServletContext().setAttribute("bbsinfo", info);
		log.info("bbs-info-加载成功");
		new IndexThread().start();
		//${applicationScope.bbsinfo.name}
	}
	
	
}
