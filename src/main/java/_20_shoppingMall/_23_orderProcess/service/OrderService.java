package _20_shoppingMall._23_orderProcess.service;

import java.util.List;

import _02_model.entity.OrderBean;

public interface OrderService {

	void createOrder(OrderBean orderBean);

	List<OrderBean> getAllOrdersByMemberId(Integer memberId);

	OrderBean getOrderById(Integer orderNo);

	public void checkStock(OrderBean orderBean);

	void cancelOrder(OrderBean orderBean);
}
