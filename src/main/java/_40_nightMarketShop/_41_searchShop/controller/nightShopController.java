package _40_nightMarketShop._41_searchShop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class nightShopController {
//	控制器方法
	@RequestMapping("/nightMarketShop")
	public String nightShop(Model model) {  //有東西要交給view 就放model
//		model.addAttribute("store", "方家雞肉飯"); // 底層是 forward()
		return "_14_nightShop/1_shop"; 
	}

}
