package _20_shoppingMall._23_orderProcess.dao;

import java.util.List;
import java.util.Set;

import _02_model.entity.OrderBean;
import _02_model.entity.OrderItemBean;

public interface OrderDao {

	void insertOrder(OrderBean orderBean);

	List<OrderBean> getAllOrdersByMemberId(Integer memberId);

	OrderBean getOrderById(Integer orderNo);

	void updateOrderNumberById(Integer order_id);




}
