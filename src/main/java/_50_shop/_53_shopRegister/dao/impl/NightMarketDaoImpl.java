package _50_shop._53_shopRegister.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.NightMarketBean;
import _50_shop._53_shopRegister.dao.NightMarketDao;



@Repository
public class NightMarketDaoImpl implements Serializable, NightMarketDao{
	private static final long serialVersionUID = 1L;
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	NightMarketDao nightMarketDao;
	
	@Override
	public List<NightMarketBean> getAllMarkets() {
		String hql = "FROM NightMarketBean";
		Session session = factory.getCurrentSession();
		List<NightMarketBean> list = session.createQuery(hql).getResultList();
		return list;
	}

}
