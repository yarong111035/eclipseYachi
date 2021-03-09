package _50_shop._53_shopRegister.dao;

import _02_model.entity.ShopBean;
import _10_member.entity.Member;

public interface ShopDao {

	int saveShop(ShopBean shop);
	
	ShopBean getShop(int shopId);
	
	int updateShop(ShopBean shop);
	
	ShopBean getShopByShopName(String name);
	
}
