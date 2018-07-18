package cc.javaee.bbs.controller.publics;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;
/*
 * 上传图片
 * 
 */
@Controller
@RequestMapping("/upload")
public class UploadController {

	@ResponseBody
	@RequestMapping("uploadimg.do")
	public Map<String, String> findAllWhere(HttpServletRequest request) throws IOException {
		//0代表失败，1代表成功，2格式错误
		Map<String, String> map=new HashMap<String, String>();
        // 转型为MultipartHttpRequest  
        try {  
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  
            List<MultipartFile> fileList = multipartRequest.getFiles("file");  
            for (MultipartFile mf : fileList) { 
                if(!mf.isEmpty()){
                	try {  
                        // 文件保存路径  
                		String dirname=Tool.getyyyyMMdd();
                        String filePath =PublicStatic.FILE_PATH+dirname+"/";  
                        File file = new File(filePath);
                		if (!file.exists()) {
                			file.mkdirs();
                		}
                        String filenamelast=getfilenamelast(mf.getOriginalFilename()).toUpperCase();
                        if(!filenamelast.equals(".JPG")&&!filenamelast.equals(".GIF")&&!filenamelast.equals(".JPEG")&&!filenamelast.equals(".PNG")&&!filenamelast.equals(".SWF")){
                        	 map.put("isok", "2");
                        }else{
                        	filenamelast=Tool.getyyyyMMddHHmmssSSS()+Tool.getRandom()+filenamelast;
                        	map.put("isok", "1");
                        	map.put("path",  dirname+"/"+filenamelast);
                        	// 转存文件  
                        	mf.transferTo(new File(filePath+filenamelast));  
                        }
					} catch (Exception e) {
						map.put("isok", "0");
						e.printStackTrace();
					}
                }  
            }  
        } catch (Exception e) {
            e.printStackTrace();  
        }  
		return map;
	}
	
    //获取文件名
    private String getfilenamelast(String filename){
    	int start=filename.lastIndexOf(".");
    	if(start!=-1){
    		filename=filename.substring(start, filename.length());
    	}
    	return filename;
    }
    
}
