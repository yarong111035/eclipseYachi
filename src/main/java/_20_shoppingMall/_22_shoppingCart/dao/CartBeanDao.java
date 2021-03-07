package _20_shoppingMall._22_shoppingCart.dao;

import java.sql.SQLException;
import java.util.List;

import _02_model.entity.CartBean;

public interface CartBeanDao {
	
	//取得所有購物車
	public List<CartBean> getAllCarts();
	
	//加入購物車
	public void addToCart(CartBean cartBean) throws SQLException;

	//判斷某會員是某要加入同樣商品到購物車
	public CartBean hasCart(Integer memberId, Integer productId);
	
	//根據cart_id刪除對應的購物車紀錄
	public void deleteCart(Integer cart_id);
	
	//更新價格
	public void updateCartTotal(CartBean cartBean);

	public List<CartBean> findCartByMemberId(Integer memberId);
}
