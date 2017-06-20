package cn.JBlog.controller;

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
	public String goEdit(@RequestParam("id")int id){
		if(id!=-1){
			
		}
		return "edit";
	}
}
