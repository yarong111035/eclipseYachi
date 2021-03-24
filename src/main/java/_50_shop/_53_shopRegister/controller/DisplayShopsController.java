package _50_shop._53_shopRegister.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import _02_model.entity.CouponBean;
import _02_model.entity.ShopBean;
import _02_model.entity.ShopCommentBean;
import _10_member.entity.Member;
import _50_shop._51_coupon.service.CouponService;
import _50_shop._53_shopRegister.service.NightMarketService;
import _50_shop._53_shopRegister.service.ShopCommentService;
import _50_shop._53_shopRegister.service.ShopService;
import _50_shop._53_shopRegister.service.ShopTypeService;

@Controller
@RequestMapping("/_50_shop/_54_showShops")
@SessionAttributes("LoginOK")
public class DisplayShopsController {

	@Autowired
	NightMarketService nightMarketService;
	
	@Autowired
	ShopService shopService;
	
	@Autowired
	ServletContext context;
	
	@Autowired
	CouponService couponService;
	
	@Autowired
	ShopCommentService shopCommentService;
	
	@Autowired
	ShopTypeService shopTypeService;
	
	
	@GetMapping("ShowShops")
//	@ResponseBody
	public String sendingAllShops(Model model) {
		List<ShopBean> list = shopService.getAllShops();
		model.addAttribute("shopList", list);
		return "/_50_shop/displayShops";
//		return "success";
	}
	
	@GetMapping("ShowShops/{shopId}")
	public String sendingSingleShop(Model model, @PathVariable Integer shopId) {
		ShopBean sb = shopService.getShop(shopId);
		List<CouponBean> cb = couponService.getShopCoupons(shopId);
		model.addAttribute("shop", sb);
		model.addAttribute("coupons", cb);
		List<ShopCommentBean> shopCommentBeanList= shopCommentService.getShopCommentByShopId(shopId);
		ShopCommentBean shopCommentBean = new ShopCommentBean();
		Member member = (Member) model.getAttribute("LoginOK");
		shopCommentBean.setMemberBean(member);
		List<ShopCommentBean> commentExistBean = null;
		try {
			commentExistBean = shopCommentService.getShopCommentByShopIdAndMemberId(shopId, member.getMemberId());
		} catch (Exception e) {
			
		}
		int count = shopCommentService.getShopCommentCount(shopId);
		model.addAttribute("shopCommentBean", shopCommentBean);
		model.addAttribute("shopCommentBeanList", shopCommentBeanList);
		model.addAttribute("commentExistBean", commentExistBean);
		model.addAttribute("count", count);
		
		return "/_50_shop/displaySingleShop";
	}
	
	@PostMapping("ShowShops/{shopId}")
	public String processShopComment(Model model,
			@PathVariable Integer shopId,
			@ModelAttribute("shopCommentBean") ShopCommentBean shopCommentBean,
			BindingResult result,
			HttpServletRequest request
			) {
		Member member = (Member) model.getAttribute("LoginOK");
		
		if (member == null) {
			return "redirect:/LoginAndRegister";
		}
		
		ShopBean sb = shopService.getShop(shopId);
		shopCommentBean.setShopBean(sb);
		shopCommentService.saveCommentBean(member, shopCommentBean);
//		System.out.println(303);
		shopService.setShopScore(shopId);
		
		
		return "redirect:/_50_shop/_54_showShops/ShowShops/" + shopId;
	}
	
	@PostMapping("/ShopResponse/{shopId}")
	public String processShopResponse(Model model,
			@PathVariable Integer shopId,
			@ModelAttribute("shopCommentBean") ShopCommentBean shopCommentBean,
			BindingResult result,
			HttpServletRequest request
			) {
		ShopBean sb = shopService.getShop(shopId);
		System.out.println("305:"+shopCommentBean.getShop_comment_id());
		shopCommentService.saveCommentBean(sb, shopCommentBean);
		
		
		return "redirect:/_50_shop/_54_showShops/ShowShops/" + shopId;
	}
	
	@GetMapping("test0315")
//	@ResponseBody
	public String test1(Model model) {
		
		return "/_13_nightMarket/MarketGongguan";
//		return "success";
	}
	
	
	
}
