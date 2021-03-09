package _50_shop._53_shopRegister.service;

import _02_model.entity.ShopBean;

public interface ShopService {
	
	int saveShop(ShopBean shop);
	
	ShopBean getShop(int shopId);
	
	int updateShop(ShopBean shop);
	
	ShopBean getShopByShopName(String name);

}