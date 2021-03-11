package _20_shoppingMall._23_orderProcess.dao;

import _02_model.entity.OrderStatusBean;

public interface OrderStatusDao {
	OrderStatusBean getStatusById(Integer statusId);
}
