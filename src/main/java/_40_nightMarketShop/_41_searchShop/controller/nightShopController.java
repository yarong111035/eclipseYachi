package _40_nightMarketShop._41_searchShop.controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import _02_model.entity.NightMarketBean;
import _02_model.entity.ShopBean;
import _50_shop._53_shopRegister.service.NightMarketService;
import _50_shop._53_shopRegister.service.ShopService;

@Controller
public class nightShopController {
	
	@Autowired
	ShopService shopService;
	
	@Autowired
	NightMarketService nightMarketService;
	
	//控制器方法
	@RequestMapping("/nightMarketShop")
	public String nightShop(Model model) {  
//		model.addAttribute("store", "方家雞肉飯"); // 底層是 forward()
		return "_14_nightShop/1_shop"; 
	}

	
	@RequestMapping("/MarketRaohe")		// 饒河夜市
	public String MarketRaohe(Model model) {  
		return "_13_nightMarket/MarketRaohe"; 
	}
	
	@RequestMapping("/MarketGongguan")		// 饒河夜市
	public String MarketGongguan(Model model) {  
		return "_13_nightMarket/MarketGongguan"; 
	}
	
	@RequestMapping("/MarketHuaxi")		// 饒河夜市
	public String MarketHuaxi(Model model) { 
		return "_13_nightMarket/MarketHuaxi"; 
	}
	
	@RequestMapping("/MarketLinjiang")		// 臨江街夜市
	public String MarketLinjiang(Model model) {  
		NightMarketBean nightMarketBean = nightMarketService.getNightMarketById(5);
		Set<ShopBean> shops = nightMarketBean.getShops();
//		List<ShopBean> shops = shopService.getShopsByMarket(nmb);
		for(ShopBean s:shops) {
			System.out.println(s);
			System.out.println(s.getShop_name());
		}
		model.addAttribute("shops", shops);
		return "_13_nightMarket/MarketLinjiang"; 
	}
	
	@RequestMapping("/MarketMonga")		// 寧夏夜市
	public String MarketMonga(Model model) {  
		NightMarketBean nightMarketBean = nightMarketService.getNightMarketById(3);
		Set<ShopBean> shops = nightMarketBean.getShops();
//		List<ShopBean> shops = shopService.getShopsByMarket(nmb);
		for(ShopBean s:shops) {
			System.out.println(s);
			System.out.println(s.getShop_name());
		}
		model.addAttribute("shops", shops);
		return "_13_nightMarket/MarketMonga"; 
	}
	
	@RequestMapping("/MarketNingxia")		// 饒河夜市
	public String MarketNingxia(Model model) {  
		return "_13_nightMarket/MarketNingxia"; 
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/MarketShilin")		// 士林夜市
	public String MarketShilin(Model model, HttpSession session) {  
		NightMarketBean nmb = nightMarketService.getNightMarketById(4);
		Set<ShopBean> shops = nmb.getShops();
//		List<ShopBean> shops = shopService.getShopsByMarket(nmb);
		for(ShopBean s:shops) {
			System.out.println(s);
			System.out.println(s.getShop_name());
		}
		model.addAttribute("shops", shops);
		return "_13_nightMarket/MarketShilin"; 
	}
	
	@RequestMapping("/MarketSouth")		// 南機場夜市
	public String MarketSouth(Model model) { 
		return "_13_nightMarket/MarketSouth"; 
	}
	
	@RequestMapping("/MarketYanping")		// 饒河夜市
	public String MarketYanping(Model model) {  
		return "_13_nightMarket/MarketYanping"; 
	}
}
