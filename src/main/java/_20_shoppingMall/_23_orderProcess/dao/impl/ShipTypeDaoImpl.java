package _20_shoppingMall._23_orderProcess.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.ProductTypeBean;
import _02_model.entity.ShipTypeBean;
import _20_shoppingMall._23_orderProcess.dao.ShipTypeDao;

@Repository
public class ShipTypeDaoImpl implements ShipTypeDao {
	@Autowired  //從RootAppConfig LocalSessionFactoryBean() 注入 factory
	SessionFactory factory;
	
	
	//取得所有配送種類
	@SuppressWarnings("unchecked")
	@Override
	public List<ShipTypeBean> getAllShipTypes() {
		String hql = "FROM ShipTypeBean";
		Session session = factory.getCurrentSession();
		List<ShipTypeBean> list = session.createQuery(hql).getResultList();
		return list;
	}


	//依據id找種類
	@Override
	public ShipTypeBean getShipTypeById(int shipTypeId) {
		Session session = factory.getCurrentSession();
		ShipTypeBean shipTypeBean = session.get(ShipTypeBean.class, shipTypeId);
		return shipTypeBean;
	}

}
