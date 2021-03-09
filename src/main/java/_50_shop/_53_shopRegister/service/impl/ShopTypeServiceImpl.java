package _50_shop._53_shopRegister.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.ShopTypeBean;
import _50_shop._53_shopRegister.dao.ShopTypeDao;
import _50_shop._53_shopRegister.service.ShopTypeService;



@Transactional
@Service
public class ShopTypeServiceImpl implements Serializable, ShopTypeService{
	
	@Autowired
	ShopTypeDao shopTypeDao;

	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopTypeBean> getShopType() {
		List<ShopTypeBean> list = shopTypeDao.getShopType();
		return list;
	}
	
}
