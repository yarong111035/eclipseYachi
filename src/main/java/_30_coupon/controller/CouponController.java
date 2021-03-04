package _30_coupon.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
//@RequestMapping("/yachi")
public class CouponController {

//記得要去 WebAppConfig 掃描
	@GetMapping("/vouchers")
	public String vouchers(Model model) {  

		return "_15_coupon/vouchers"; 
	}			
	
	@GetMapping("/vouchers_interface")
	public String vouchers_interface(Model model) {  

		return "_15_coupon/vouchers_interface"; 
	}
}
