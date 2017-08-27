package cn.JBlog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WebController {
	
	@RequestMapping("/manage")
	public String goManage(){
		return "manage";
	}
	
	@RequestMapping("/goEdit")
	public String goEdit(@RequestParam("id")int id,HttpServletRequest request){
		HttpSession session=request.getSession();
		session.setAttribute("id", id);
		if(id!=-1){
			
		}
		return "edit";
	}
	
	@RequestMapping("/")
	public String goIndex(){
		return "index";
	}
}
