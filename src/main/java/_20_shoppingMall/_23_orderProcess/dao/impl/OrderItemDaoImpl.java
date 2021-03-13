package _20_shoppingMall._23_orderProcess.dao.impl;

import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.OrderItemBean;
import _20_shoppingMall._23_orderProcess.dao.OrderItemDao;
import _20_shoppingMall._23_orderProcess.exception.ProductStockException;

@Repository
public class OrderItemDaoImpl implements OrderItemDao {
	@Autowired
	private SessionFactory factory;
	
	
	@Override
	public void insertItems(Set<OrderItemBean> orderItems) {
		Session session = factory.getCurrentSession();
		session.save(orderItems);
	}


	//更新產品庫存量
	@Override
	public void updateProductStock(OrderItemBean item) {
		Session session = factory.getCurrentSession();
		String hqlSelect = " SELECT product_stock "
				   + " FROM ProductBean "
				   + " WHERE product_id = :product_id ";
		String hqlUpdate = " UPDATE ProductBean "
						 + " SET product_stock = product_stock - :orderItem_amount "
						 + " WHERE product_id = :product_id ";
		// 1. 取得某產品目前庫存量
		Integer stock = (Integer) session.createQuery(hqlSelect)
										 .setParameter("product_id", item.getProductBean().getProduct_id())
										 .getSingleResult();
		if(stock == null) {
			stock= 0;
		}
		// 2. 目前庫存量扣掉訂購數量(若小於0 丟出例外)
		int resultStock = stock -  item.getAmount();
		if(resultStock < 0) {
			throw new ProductStockException(
				"庫存數量不足: product_id: " + item.getProductBean().getProduct_id() 
				+ ", 目前庫存量: " + stock + ", 訂購數量: " + item.getAmount());
		}
		
		//   若相減後庫存量大於0，則更新產品庫存數量
		session.createQuery(hqlUpdate)
			   .setParameter("orderItem_amount", item.getAmount())
			   .setParameter("product_id", item.getProductBean().getProduct_id())
		       .executeUpdate();
	}

}
