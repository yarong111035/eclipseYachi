package _30_coupon;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class Coupon_Controller {
	
	@RequestMapping("/vouchers_interface")
	public String vouchers_interface(Model model) {
		return "_15_coupon/vouchers_interface"; 
	}
	@RequestMapping("/vouchers")
	public String vouchers(Model model) {
		return "_15_coupon/vouchers"; 
	}
	
}