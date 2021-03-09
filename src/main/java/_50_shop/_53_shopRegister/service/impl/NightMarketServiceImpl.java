package _50_shop._53_shopRegister.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.NightMarketBean;
import _50_shop._53_shopRegister.dao.NightMarketDao;
import _50_shop._53_shopRegister.service.NightMarketService;


@Transactional
@Service
public class NightMarketServiceImpl implements Serializable, NightMarketService{

	@Autowired
	NightMarketDao nightMarketDao;
	
	@Transactional
	@Override
	public List<NightMarketBean> getAllMarkets() {
		
		return nightMarketDao.getAllMarkets();
	}
	

}
