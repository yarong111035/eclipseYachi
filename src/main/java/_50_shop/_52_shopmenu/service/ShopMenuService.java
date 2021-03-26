package _50_shop._52_shopmenu.service;

import java.util.List;

import _02_model.entity.ShopMenuBean;

//import _06_coupon.model.CouponBean;


public interface ShopMenuService {
	
	ShopMenuBean getMenu(int menu_id);
	
	int saveMenu (ShopMenuBean bean);
	
	List<ShopMenuBean> getAllMenu();
	
	List<ShopMenuBean> getShopMenu(int shopId);
	
	int updateMenu(ShopMenuBean bean);
	
	int deleteMenu(int menu_id);


}
