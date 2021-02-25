package com.example.demo.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {
	
	
	// 首頁的映射
	@RequestMapping({"/","/index"}) 
	public String jspHome(Model model) {
		
		return "index";  //視圖指定向index.jsp
	}
	
	@RequestMapping("/_00_util/allUtil/jsp/header") 
	public String header_fragment(Model model) {
		
		return "/_00_util/allUtil/jsp/header"; 
	}
	
	
}
