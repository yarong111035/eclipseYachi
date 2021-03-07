package _20_shoppingMall._22_shoppingCart.service.impl;

import java.sql.SQLException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import _02_model.entity.CartBean;
import _02_model.entity.ProductBean;
import _10_member.dao.MemberDao;
import _10_member.entity.Member;
import _20_shoppingMall._21_product.dao.ProductDao;
import _20_shoppingMall._22_shoppingCart.dao.CartBeanDao;
import _20_shoppingMall._22_shoppingCart.service.CartBeanService;
@Service
public class CartBeanServiceImpl implements CartBeanService {
	@Autowired
	CartBeanDao cartBeanDao;
	@Autowired
	ProductDao productDao;
	@Autowired
	MemberDao memberDao;
	
	@Transactional
	@Override
	public void addToCart(Integer memberId, Integer productId) {
		try {
			//判斷購物車某會員是否已經加入某商品至購物車
			CartBean cartBean = cartBeanDao.hasCart(memberId, productId);
			if(cartBean == null) {
				Member member = memberDao.findByMemberId(memberId);
				ProductBean productBean = productDao.getProductById(productId);
			
				cartBean = new CartBean();
//				封裝購物車資訊
				cartBean.setMemberBean(member);
				cartBean.setProductBean(productBean);
				cartBean.setCart_amount(1); //按一次只會+1
				cartBean.setCart_total(cartBean.getCart_total());//存入總金額
				
//				存入購物車
				cartBeanDao.addToCart(cartBean);
				
			}else { //購物車裡面已經存在會員id 與 產品id 
				cartBean.setCart_amount(cartBean.getCart_amount() + 1);
//				當購物車存在修改購物車價格(數量改了價格也要改)
				cartBeanDao.updateCartTotal(cartBean);
				
			}
			
			//創建購物車
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	@Transactional
	public List<CartBean> findCartByMemberId(Integer memberId) {
		return cartBeanDao.findCartByMemberId(memberId);
	}

	@Override
	@Transactional
	//更新購物車的total(當產品價格改變須同步更新購物車表格的total)
	public void updateCartTotal() {
		List<CartBean> allCarts = cartBeanDao.getAllCarts();
		for(CartBean cart : allCarts) {
			if(cart.getCart_total() != null) {
				cartBeanDao.updateCartTotal(cart);
			}
		}
	}

	@Override
	@Transactional
	public void deleteCart(Integer cart_id) {
		cartBeanDao.deleteCart(cart_id);
	}
	
}
