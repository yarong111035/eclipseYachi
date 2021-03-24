package _40_nightMarketShop._41_searchShop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class nightShopController {
	//控制器方法
	@RequestMapping("/nightMarketShop")
	public String nightShop(Model model) {  //有東西要交給view 就放model
//		model.addAttribute("store", "方家雞肉飯"); // 底層是 forward()
		return "_14_nightShop/1_shop"; 
	}

	
	@RequestMapping("/MarketRaohe")		// 饒河夜市
	public String MarketRaohe(Model model) {  //有東西要交給view 就放model
		return "_13_nightMarket/MarketRaohe"; 
	}
	
	@RequestMapping("/MarketGongguan")		// 饒河夜市
	public String MarketGongguan(Model model) {  //有東西要交給view 就放model
		return "_13_nightMarket/MarketGongguan"; 
	}
	
	@RequestMapping("/MarketHuaxi")		// 饒河夜市
	public String MarketHuaxi(Model model) {  //有東西要交給view 就放model
		return "_13_nightMarket/MarketHuaxi"; 
	}
	
	@RequestMapping("/MarketLinjiang")		// 饒河夜市
	public String MarketLinjiang(Model model) {  //有東西要交給view 就放model
		return "_13_nightMarket/MarketLinjiang"; 
	}
	
	@RequestMapping("/MarketMonga")		// 饒河夜市
	public String MarketMonga(Model model) {  //有東西要交給view 就放model
		return "_13_nightMarket/MarketMonga"; 
	}
	
	@RequestMapping("/MarketNingxia")		// 饒河夜市
	public String MarketNingxia(Model model) {  //有東西要交給view 就放model
		return "_13_nightMarket/MarketNingxia"; 
	}
	
	@RequestMapping("/MarketShilin")		// 饒河夜市
	public String MarketShilin(Model model) {  //有東西要交給view 就放model
		return "_13_nightMarket/MarketShilin"; 
	}
	
	@RequestMapping("/MarketSouth")		// 饒河夜市
	public String MarketSouth(Model model) {  //有東西要交給view 就放model
		return "_13_nightMarket/MarketSouth"; 
	}
	
	@RequestMapping("/MarketYanping")		// 饒河夜市
	public String MarketYanping(Model model) {  //有東西要交給view 就放model
		return "_13_nightMarket/MarketYanping"; 
	}
}
