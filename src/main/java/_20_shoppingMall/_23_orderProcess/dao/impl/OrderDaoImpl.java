package _20_shoppingMall._23_orderProcess.dao.impl;

import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.OrderBean;
import _02_model.entity.OrderItemBean;
import _20_shoppingMall._23_orderProcess.dao.OrderDao;


@Repository
public class OrderDaoImpl implements OrderDao {
	@Autowired
	private SessionFactory factory;
	
	@Override
	public void insertOrder(OrderBean orderBean) {
		Session session = factory.getCurrentSession();
		session.save(orderBean);
	}


}
