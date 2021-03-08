package _20_shoppingMall._22_shoppingCart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import _20_shoppingMall._22_shoppingCart.service.CartBeanService;

@Controller
@SessionAttributes({"cartList"})
public class removeCartController {
	@Autowired
	CartBeanService cartBeanService;
	
	//移除session的cartList必須在另一個 controller移除
	//否則連會員 與 頁數 也會被一同移除
	//刪除一筆購物車紀錄(根據id刪除)
		@DeleteMapping("/cartDelete/{cart_id}")
		public String deleteCart(
				@PathVariable Integer cart_id,
				SessionStatus status
				) {
			cartBeanService.deleteCart(cart_id);
			status.setComplete();
			return "redirect:/showCartContent";
		}
}
