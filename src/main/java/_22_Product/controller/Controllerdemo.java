package _22_Product.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Controllerdemo {
	@RequestMapping("/home")
	public String administrator(Model model) {  //有東西要交給view 就放model

		return "_17_home/home"; 
	}
}
