package _80_home.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	// 首頁的映射
	@RequestMapping({"/","/home"}) 
	public String jspHome(Model model) {
//		return "/_11_member/index";  //視圖指定向index.jsp
		return "_17_home/home";  //視圖指定向_17_home/home
	}
}
