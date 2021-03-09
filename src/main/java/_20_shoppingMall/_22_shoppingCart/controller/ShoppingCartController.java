package _20_shoppingMall._22_shoppingCart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.mysql.cj.xdevapi.JsonArray;

import _02_model.entity.CartBean;
import _10_member.entity.Member;
import _20_shoppingMall._22_shoppingCart.service.CartBeanService;

@Controller
@SessionAttributes({"LoginOK", "pageNo","cartList"})
public class ShoppingCartController {
	@Autowired
	CartBeanService cartBeanService;
	/**
	 * 創建購物車
	 */
	
	@PostMapping("/BuyProduct.do")
	public String creatCart(
			Model model,
			@RequestParam("product_id") Integer product_id,
			@RequestParam("qty") Integer qty,
			HttpServletRequest request,
			HttpServletResponse response
			) throws ServletException, IOException {
		
		//1.判斷用戶是否存在
		Member member = (Member)model.getAttribute("LoginOK");
		if(member == null) {
			return "redirect:/LoginAndRegister";
		}
		HttpSession session = request.getSession(false); 
		if(session == null) {
			return "redirect:/LoginAndRegisters";
		}
		
		//獲取會員的id
		Integer memberId = member.getMemberId();
		//創建購物車(傳入會員編號, 產品編號, 數量)
		cartBeanService.addToCart(memberId, product_id, qty);

		return "redirect:/DisplayPageProducts";
		
	}

	
	/**
	 * 顯示查看購物車
	 */
	@GetMapping("/showCartContent")
	public String showCartContent(
			Model model,
			SessionStatus status
			) {
		// STEP1:判斷用戶是否登入
		Member member = (Member)model.getAttribute("LoginOK");
		if(member == null) {
			//@SessionAttributes需要清除時，使用SessionStatus.setComplete();來清除。!它只清除@SessionAttributes的session，不會清除HttpSession的數據
			status.setComplete();
			return "redirect:/LoginAndRegister";
		}
		
		// STEP2:取得用戶id
		Integer memberId = member.getMemberId();
		
		// STEP3:根據用戶id，從cart表格撈取該用戶的購物車紀錄
		List<CartBean> carts = cartBeanService.findCartByMemberId(memberId);
		if(carts != null) {
			Collections.reverse(carts); //反轉順序，越新的在越上面
			model.addAttribute("cartList", carts);
		}
		return "_12_shoppingmall/5_cartContent";
	}
	
	/**
	 * 顯示並加入購物車
	 */
	@GetMapping("/showAndAddCart/{product_id}")
	public String showAndAddCart(
			Model model,
			@RequestParam("qty") Integer qty,
			@PathVariable("product_id") Integer product_id,
			HttpServletRequest request,
			HttpServletResponse response
			) throws ServletException, IOException {
		
		//1.判斷用戶是否存在
		Member member = (Member)model.getAttribute("LoginOK");
		if(member == null) {
			return "redirect:/LoginAndRegister";
		}
		//獲取會員的id
		Integer memberId = member.getMemberId();
		//創建購物車
		cartBeanService.addToCart(memberId, product_id, qty);
		return "redirect:/showCartContent";
	}
	
	//刪除一筆購物車紀錄(根據id刪除)
//	@DeleteMapping("/cartDelete/{cart_id}")
//	public String deleteCart(
//			@PathVariable Integer cart_id,
//			SessionStatus status
//			) {
//		cartBeanService.deleteCart(cart_id);
//		status.setComplete();
//		return "redirect:/showCartContent";
//	}
	
		
	//透過此方式產生下拉選單數量的值
//	@ModelAttribute("qtyMap")
//	public Map<Integer,Integer> getQtyList(){
//		 Map<Integer, Integer> qtyMap = new HashMap<>();
//		 for(Integer i = 2; i <= 10; i++) {
//			 qtyMap.put(i, i);
//		 }
//		 return qtyMap;
//	}
	
	
	/**
	 * 更新購物車數量
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/update/{cart_id}/{cart_amount}/{product_price}")
	public String updateCartAmount(
			Model model,
			@PathVariable Integer cart_id,
			@PathVariable Integer cart_amount,
			@PathVariable Double product_price
			) {
		// STEP1: 取出傳遞過來的參數(cart_id, cart_amount, product_price)
		//1.判斷用戶是否存在
		Member member = (Member)model.getAttribute("LoginOK");
		if(member == null) {
			return "redirect:/LoginAndRegister";
		}
//		Integer cid = (Integer) model.getAttribute("cart_id");
//		Integer amount = (Integer) model.getAttribute("cart_amount");
//		Double price = (Double) model.getAttribute("product_price");
		
		// STEP2: 更新購物車 
		cartBeanService.udateCartById(cart_id, cart_amount, product_price);
		
		return "forward:/showCartContent";
	}
	
	
}
