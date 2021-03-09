package _50_shop._53_shopRegister.service.impl;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.ShopBean;
import _50_shop._53_shopRegister.dao.ShopDao;
import _50_shop._53_shopRegister.service.ShopService;



@Transactional
@Service
public class ShopServiceImpl implements Serializable, ShopService{
	
	@Autowired
	ShopDao shopDao;

	@Override
	public int saveShop(ShopBean shop) {
		return shopDao.saveShop(shop);
	}

	@Override
	public ShopBean getShop(int shopId) {
		return shopDao.getShop(shopId);
	}

	@Override
	public int updateShop(ShopBean shop) {
		return shopDao.updateShop(shop);
	}

	@Override
	public ShopBean getShopByShopName(String name) {
		return shopDao.getShopByShopName(name);
	}

}
