package _80_home.controller;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import _02_model.entity.CouponBean;
import _02_model.entity.NightMarketBean;
import _02_model.entity.ProductBean;
import _02_model.entity.ShopBean;
import _80_home.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;
	
	
	// 查詢所有的商品 --> 依商品名稱
	@RequestMapping("/search/product")
	public String searchProductsByName(@RequestParam String product_name,Model model) {
				
		List<ProductBean> list = searchService.getAllProductsByName(product_name);

		if(product_name == "") {
			
			model.addAttribute("keyword","?");
			model.addAttribute("list",list);

			return "/_17_home/searchALL";
		}
				
		model.addAttribute("keyword",product_name);
		model.addAttribute("list",list);
		
			
		return "/_17_home/searchALL";
	}
	
	
	// 查詢所有的商品 --> 依特定的商品名稱   商品價格由大至小排列
	@RequestMapping("/search/product/high/{product_name}")
	public String searchProductsByHighPrice(@PathVariable String product_name,Model model) {
		
		List<ProductBean> list = searchService.getAllProductsByHighPrice(product_name);
		
		model.addAttribute("keyword",product_name);
		model.addAttribute("list",list);
		
		return "/_17_home/searchALL";
	}
	
	// 查詢所有的商品 --> 依特定的商品名稱   商品價格由小至大排列
	@RequestMapping("/search/product/low/{product_name}")
	public String searchProductsByLowPrice(@PathVariable String product_name,Model model) {
		
		List<ProductBean> list = searchService.getAllProductsByLowPrice(product_name);
		
		for (ProductBean productBean : list) {
			System.out.println(productBean.getProduct_name()+"--->"+productBean.getProduct_price());
		}
		
		model.addAttribute("keyword",product_name);
		model.addAttribute("list",list);
		
		return "/_17_home/searchALL";
	}
	
	// 查詢所有的商品 --> 依特定的商品名稱  依使用者輸入商品價格低 ~ 到商品價格高
	@RequestMapping("/search/product/range/{product_name}")
	public String searchProductsByBetweenPrice(@PathVariable String product_name,
											   @RequestParam Double lowPrice,
											   @RequestParam Double highPrice,Model model) {
		
		List<ProductBean> list = searchService.getAllProductsByBetweenPrice(product_name,lowPrice, highPrice);
		
		model.addAttribute("keyword",product_name);
		model.addAttribute("list",list);
		
		return "/_17_home/searchALL";
	}
	
	// 查詢所有的商品  --> 顯示商城全部的商品 
	@RequestMapping("/search/ALLproducts")
	public String searchALLProducts(Model model) {
		
		List<ProductBean> list = searchService.getALLProducts();
		
		model.addAttribute("keyword","商城的商品");
		model.addAttribute("list",list);
		
		return "/_17_home/searchALL";
	}
	
	
	
	
	// 查詢所有的商品 --> 依照最新上架的日期
	@RequestMapping("/test07")
	@ResponseBody
	public String searchReleaseNewProduct() {
		
		List<ProductBean> list = searchService.getReleaseNewProduct();
		
		for (ProductBean pBean : list) {
			System.out.println(pBean.getProduct_name()+" --> "+pBean.getProduct_release());
		}
		
		return "測試成功";
	}
	
	
	// 查詢所有的商品 --> 依照商品的類型
	@RequestMapping("/test08/{product_type_id}")
	@ResponseBody
	public String searchProductTypeBean(@PathVariable Integer product_type_id) {
		
		Set<ProductBean> set = searchService.getProductTypeBean(product_type_id);
		
		for (ProductBean pTypeBean : set) {
			System.out.println(pTypeBean.getProduct_name());
		}
		
		return "測試成功";
	}
	

	// Like模糊搜尋夜市 
	@RequestMapping("/test01")
	public String searchNight(@RequestParam String market_name) {
		
		List<NightMarketBean> list = searchService.searchNight(market_name);
		
		for (NightMarketBean nightMarketBean : list) {
			System.out.println(nightMarketBean.getMarket_name());
		}
		
		return "/_17_home/searchALL";
	}
	
	// 查詢所有的優惠券 (優惠券有效期限大於當前時間) 尚未過期
	@RequestMapping("/test02")
	@ResponseBody
	public String searchCouponNoExpired() {
		
		List<CouponBean> list = searchService.getAllCouponNoExpired();
		for (CouponBean couponBean : list) {
			System.out.println(couponBean.getCoupon_name());
		}
		
		return "測試成功";
	}
	
	
	
	
	
	// 查詢所有的商家 --> 依商家名稱
	@RequestMapping("/test09")
	@ResponseBody
	public String searchShopByName(@RequestParam String shop_name) {
		
		List<ShopBean> list = searchService.getAllShopByName(shop_name);
		
		for (ShopBean shopBean : list) {
			System.out.println(shopBean.getShop_name());
		}
		
		return "測試成功";

	}
	
	// 依商家的類型找出所有的商家 
	@RequestMapping("/test10/{shop_type_id}")
	@ResponseBody
	public String searchShopByShop_type_id(@PathVariable Integer shop_type_id) {
		
		Set<ShopBean> set = searchService.getAllShopBean(shop_type_id);
		
		for (ShopBean shopBean : set) {
			System.out.println(shopBean.getShop_name());
		}
		
		return "測試成功";
	}

	
	
	
	
	
	
}
