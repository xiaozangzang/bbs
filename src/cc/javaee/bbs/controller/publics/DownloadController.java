package cc.javaee.bbs.controller.publics;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;

/*
 * 展示图片
 * 
 */


@Controller
@RequestMapping("/download")
public class DownloadController {

	//展示图片
	@RequestMapping("downloadimg.do")
	public void downloadimg(HttpServletRequest request,String f, HttpServletResponse response) {
		try {
			if("".equals(f))f="touxiang.jpg";
			FileInputStream is = new FileInputStream(PublicStatic.FILE_PATH+f);
			int i = is.available(); // 得到文件大小  
			byte data[] = new byte[i];
			is.read(data); // 读数据  
			is.close();
			response.setContentType("image/*"); // 设置返回的文件类型  
			OutputStream toClient = response.getOutputStream(); // 得到向客户端输出二进制数据的对象  
			toClient.write(data); // 输出数据  
			toClient.close();
		} catch (Exception e) {
			
		}
	}
	
	//下载所有文件
	@RequestMapping("downloadall.do")
	public void downloadall(HttpServletRequest request,String f, HttpServletResponse response) {
		try {
			if("".equals(f))f="touxiang.jpg";
			String filename="";
			int lastIndexOf = f.lastIndexOf("/")+1;
			filename=f.substring(lastIndexOf, f.length());
			response.setContentType("multipart/form-data");   
	        //2.设置文件头：最后一个参数是设置下载文件名(假如我们叫a.pdf)   
	        response.setHeader("Content-Disposition", "attachment;fileName="+filename);   
			FileInputStream is = new FileInputStream(PublicStatic.FILE_PATH+f);
			int i = is.available(); // 得到文件大小  
			byte data[] = new byte[i];
			is.read(data); // 读数据  
			is.close();
			OutputStream toClient = response.getOutputStream(); // 得到向客户端输出二进制数据的对象  
			toClient.write(data); // 输出数据  
			toClient.close();
		} catch (Exception e) {
			
		}
	}
	//下载其它文件
	@RequestMapping("downloadfile.do")
	public void downloadfile(HttpServletRequest request,String f, HttpServletResponse response) {
		try {
			if("".equals(f))f="touxiang.jpg";
			FileInputStream is = new FileInputStream(PublicStatic.FILE_PATH+f);
			int i = is.available(); // 得到文件大小  
			byte data[] = new byte[i];
			is.read(data); // 读数据  
			is.close();
			OutputStream toClient = response.getOutputStream(); // 得到向客户端输出二进制数据的对象  
			toClient.write(data); // 输出数据  
			toClient.close();
		} catch (Exception e) {
			
		}
	}
	
	
	
}
