package _20_shoppingMall._23_orderProcess.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.OrderStatusBean;
import _20_shoppingMall._23_orderProcess.dao.OrderStatusDao;
@Repository
public class OrderStatusDaoImpl implements OrderStatusDao {
	@Autowired  //從RootAppConfig LocalSessionFactoryBean() 注入 factory
	SessionFactory factory;
	
	@Override
	public OrderStatusBean getStatusById(Integer statusId) {
		Session sesison = factory.getCurrentSession();
		OrderStatusBean statusBean = sesison.get(OrderStatusBean.class, statusId);
		return statusBean;
	}

}
