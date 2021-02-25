package _91_admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EditController {
	@RequestMapping("/administrator")
	public String administrator(Model model) {  

		return "_16_admin/administrator"; 
	}
	@RequestMapping("/admin_coupon")
	public String admin_coupon(Model model) { 

		return "_16_admin/admin_coupon"; 
	}
	@RequestMapping("/admin_chatroom")
	public String admin_chatroom(Model model) {  

		return "_16_admin/admin_chatroom"; 
	}
	@RequestMapping("/admin_announcement")
	public String admin_announcement(Model model) {  

		return "_16_admin/admin_announcement"; 
	}
	@RequestMapping("/admin_adinfo")
	public String admin_adinfo(Model model) {  

		return "_16_admin/admin_adinfo"; 
	}
	@RequestMapping("/admin_activity")
	public String admin_activity(Model model) {  

		return "_16_admin/admin_activity"; 
	}
	
//	新增產品頁面
//	@RequestMapping("/admin_product")
//	public String admin(Model model) {  
//
//		return "_16_admin/insertProduct"; 
//	}
}
