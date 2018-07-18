package cc.javaee.bbs.controller.publics;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.javaee.bbs.model.User;
import cc.javaee.bbs.tool.VerifyCodeUtils;

/*
 * 展示图片
 * 
 */


@Controller
@RequestMapping("/yanzhengma")
public class YanzhengmaController {

	
	@RequestMapping("index.do")
	public void findAllWhere(HttpServletRequest request,String f, HttpServletResponse response) {
		response.setHeader("Pragma", "No-cache"); 
        response.setHeader("Cache-Control", "no-cache"); 
        response.setDateHeader("Expires", 0); 
        response.setContentType("image/jpeg"); 
           
        //生成随机字串 
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4); 
        //存入会话session 
        HttpSession session = request.getSession(true); 
        //删除以前的
        session.removeAttribute("yanzhengma");
        session.setAttribute("yanzhengma", verifyCode.toLowerCase()); 
        //生成图片 
        int w = 150, h = 50; 
        try {
			VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);
		} catch (IOException e) {
			e.printStackTrace();
		} 
   
	}
	
	//验证验证码
	@ResponseBody
	@RequestMapping("isyanzhengma.do")
	public int isyanzhengma(HttpServletRequest request,String yanzhengma) {
		HttpSession session = request.getSession(true); 
		String yanzhengmasession=(String)session.getAttribute("yanzhengma");
		int flag=0;
		if(yanzhengmasession!=null&&yanzhengmasession.equalsIgnoreCase(yanzhengma)){
			flag=1;
		}
		return flag;
	}
	
	
}
