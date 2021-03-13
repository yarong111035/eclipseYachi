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

	//從號表格取得訂單號碼
	@Override
	public void updateOrderNumberById(Integer order_id) {
		Session session = factory.getCurrentSession();
		String hqlSelect = " SELECT o.random_code "
				   + " FROM OrderNumberBean o "
				   + " WHERE o.random_id = :order_id ";
		String hqlUpdate = " UPDATE OrderBean o "
						 + " SET o.orderNumber = :orderNumber"
						 + " WHERE o.order_id = :order_id";
		//依據訂單id 取得訂單號
		String orderCode = (String) session.createQuery(hqlSelect)
										   .setParameter("order_id", order_id)
										   .getSingleResult();
		//加入有序訂單號欄位
		session.createQuery(hqlUpdate)
			   .setParameter("orderNumber", orderCode)
			   .setParameter("order_id", order_id)
			   .executeUpdate();
	
	}


}
