package _50_shop._53_shopRegister.service;

import java.util.List;
import java.util.Set;

import _02_model.entity.NightMarketBean;
import _02_model.entity.ShopBean;

public interface ShopService {
	
	int saveShop(ShopBean shop);
	
	ShopBean getShop(int shopId);
	
	int updateShop(ShopBean shop);
	
	ShopBean getShopByShopName(String name);
	
	List<ShopBean> getAllShops();

	void setShopScore(int shopId);
	
	List<ShopBean> getShopsByMarket(NightMarketBean nightMarketBean);
	
}
