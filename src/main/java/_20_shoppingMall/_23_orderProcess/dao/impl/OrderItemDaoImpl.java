package _20_shoppingMall._23_orderProcess.dao.impl;

import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.OrderItemBean;
import _20_shoppingMall._23_orderProcess.dao.OrderItemDao;

@Repository
public class OrderItemDaoImpl implements OrderItemDao {
	@Autowired
	private SessionFactory factory;
	
	
	@Override
	public void insertItems(Set<OrderItemBean> orderItems) {
		Session session = factory.getCurrentSession();
		session.save(orderItems);
	}

}
