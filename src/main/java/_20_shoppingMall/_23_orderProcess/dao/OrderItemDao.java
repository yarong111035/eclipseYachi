package _20_shoppingMall._23_orderProcess.dao;

import java.util.Set;

import _02_model.entity.OrderItemBean;

public interface OrderItemDao {

	void insertItems(Set<OrderItemBean> orderItems);

	void updateProductStock(OrderItemBean item);

}
