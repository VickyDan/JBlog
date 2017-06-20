package cn.JBlog.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.baidu.ueditor.ActionEnter;
/*
 * 文件上传控制器
 */
@Controller
public class UeditorController {
	@RequestMapping("/updateimage")
	@ResponseBody
    public String updateImage(@RequestParam("upfile")MultipartFile file,HttpServletRequest request){
    	String filePath=null;
    	JSONObject jsonObject=new JSONObject();
		if(!file.isEmpty()){
    		filePath=request.getSession().getServletContext().getRealPath("/")+"assests/upload/image/"+file.getOriginalFilename();
    		try {
			   FileUtils.copyInputStreamToFile(file.getInputStream(),new File(filePath));
			   jsonObject.put("state", "SUCCESS");
    		} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				jsonObject.put("state", "ERROR");
			}
    		
    		jsonObject.put("url", filePath);
    		jsonObject.put("title", file.getName());
    		jsonObject.put("ariginal", file.getOriginalFilename());
    		
    	}
		return jsonObject.toString();
    }
	
	@RequestMapping("/config")
	@ResponseBody
	public String Init(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		
		    request.setCharacterEncoding( "utf-8" );
			response.setHeader("Content-Type" , "text/html");
		
			String rootPath = request.getSession().getServletContext().getRealPath("/");
			return new ActionEnter( request, rootPath ).exec();
	}
}
