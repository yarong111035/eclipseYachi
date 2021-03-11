package _20_shoppingMall._22_shoppingCart.service;

import java.util.List;

import _02_model.entity.CartBean;
import _02_model.entity.ProductBean;
import _10_member.entity.Member;

public interface CartBeanService {
	public void addToCart(Integer memberId, Integer productId, Integer qty);

	public List<CartBean> findCartByMemberId(Integer memberId);
	
	//更新購物車的total(當產品價格改變須同步更新購物車表格的total)
	public void updateCartTotal();
	
	//刪除一筆購物車紀錄
	public void deleteCart(Integer cart_id);

	//根據使用者id的清空所有購物車紀錄
	public void deleteCartByMemberId(Integer memberId);
	
	public void udateCartById(Integer cid, Integer amount, Double price);
}
