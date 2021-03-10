package _20_shoppingMall._22_shoppingCart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProcessOrderController {
	
	@RequestMapping("/orderDetail")
	public String orderDetail() {
		return "_11_member/mamber_order";
	}
}
