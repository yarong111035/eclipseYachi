package _10_member.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import _02_model.entity.CouponBean;
import _10_member.entity.Member;
import _10_member.service.FavoriteShopService;
import _50_shop._51_coupon.service.CouponService;
import _50_shop._53_shopRegister.service.ShopService;

@Controller
@RequestMapping("/_50_shop/_54_showShops")
@SessionAttributes({"LoginOK"})
public class FavoriteShopController {
	
	@Autowired
	CouponService couponService;
	
	@Autowired
	FavoriteShopService favoriteShopService;
	
	@Autowired
	ShopService shopService;
	
	@Autowired
	ServletContext context;
	
	@GetMapping("addFavoriteShop/{shopId}")
	public String showUpdateForm(Model model, @PathVariable Integer shopId) {
		Member member = (Member) model.getAttribute("LoginOK");
		try {
			favoriteShopService.saveFavoriteShop(shopService.getShop(shopId), member);
		} catch (Exception e) {
			return "redirect:/_50_shop/_54_showShops/ShowShops/" + shopId;
		}
		
		return "redirect:/_50_shop/_54_showShops/ShowShops/" + shopId;
	}
	
}
