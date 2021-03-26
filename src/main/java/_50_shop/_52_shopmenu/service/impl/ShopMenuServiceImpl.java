package _50_shop._52_shopmenu.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.ShopMenuBean;

//import _06_coupon.dao.CouponDao;
//import _06_coupon.model.CouponBean;

import  _50_shop._52_shopmenu.dao.ShopMenuDao;
import  _50_shop._52_shopmenu.service.ShopMenuService;

@Transactional
@Service
public class ShopMenuServiceImpl implements Serializable, ShopMenuService{
	
	@Autowired
	ShopMenuDao shopmenudao;

	@Transactional
	@Override
	public ShopMenuBean getMenu(int menu_id) {
		
		return shopmenudao.getMenu(menu_id);
	}

	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public int saveMenu(ShopMenuBean bean) {
		
		return shopmenudao.saveMenu(bean);
	}

	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopMenuBean> getAllMenu() {
		
		return shopmenudao.getAllMenu();
	}
	
	@Transactional
	@Override
	public List<ShopMenuBean> getShopMenu(int shopId) {
		
		return shopmenudao.getShopMenu(shopId);
	}
	
	@Transactional
	@Override
	public int updateMenu(ShopMenuBean bean) {
		
		return shopmenudao.updateMenu(bean);
	}

	@Transactional
	@Override
	public int deleteMenu(int menu_id) {
		
		return shopmenudao.deleteMenu(menu_id);
	}
	
	

}
