package _20_shoppingMall._23_orderProcess.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _02_model.entity.CartBean;
import _02_model.entity.OrderBean;
import _02_model.entity.OrderItemBean;
import _02_model.entity.OrderNumberBean;
import _02_model.entity.OrderStatusBean;
import _02_model.entity.PayTypeBean;
import _02_model.entity.ShipTypeBean;
import _20_shoppingMall._22_shoppingCart.dao.CartBeanDao;
import _20_shoppingMall._23_orderProcess.dao.OrderDao;
import _20_shoppingMall._23_orderProcess.dao.OrderItemDao;
import _20_shoppingMall._23_orderProcess.dao.OrderNumberDao;
import _20_shoppingMall._23_orderProcess.dao.OrderStatusDao;
import _20_shoppingMall._23_orderProcess.dao.PayTypeDao;
import _20_shoppingMall._23_orderProcess.dao.ShipTypeDao;
import _20_shoppingMall._23_orderProcess.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired 
	OrderDao orderDao;
	@Autowired
	OrderNumberDao orderNumberDao;
	@Autowired
	OrderStatusDao orderStatusDao;
	@Autowired
	ShipTypeDao shipTypeDao;
	@Autowired
	PayTypeDao payTypeDao;
	@Autowired
	CartBeanDao cartBeanDao;
	@Autowired
	OrderItemDao orderItemDao;
	
	@Override
	@Transactional
	public void createOrder(OrderBean orderBean) {
// 1. 新增訂單紀錄
		//訂單號碼從另一個table取(根據訂單自增碼取對應表格的自增碼)
//		OrderNumberBean orderNumberBean = orderNumberDao.getNumberById(orderBean.getOrder_id());
//		orderBean.setOrderNumberBean(orderNumberBean);
		//狀態默認未付款
		OrderStatusBean OrderStatusBean = orderStatusDao.getStatusById(1);
		ShipTypeBean shipTypeBean = shipTypeDao.getShipTypeById(orderBean.getShipTypeBean().getShip_type_id());
		PayTypeBean payTypeBean = payTypeDao.getPayTypeById(orderBean.getPayTypeBean().getPay_type_id());
		
		//set OrderBean 外鍵欄位
		orderBean.setShipTypeBean(shipTypeBean);
		orderBean.setPayTypeBean(payTypeBean);
		orderBean.setOrder_datetime(new Date());
		orderBean.setOrderStatusBean(OrderStatusBean);
		

		
// 2. 新增訂單明細紀錄(訂單細項:訂單 = 多 : 1)
		//取出"購物車商品"轉成"訂單明細"
		List<CartBean> carts = cartBeanDao.getAllCarts();
		Set<OrderItemBean> orderItems = new HashSet<>();
		for(CartBean cart : carts) {
			OrderItemBean item = new OrderItemBean();
			item.setOrderBean(orderBean); //放入訂單號碼
			item.setProductBean(cart.getProductBean()); //取得商品訊息
			item.setAmount(cart.getCart_amount()); //取得某項商品購買數量
			item.setUnitPrice(cart.getProductBean().getProduct_price());//商品單價
			item.setDiscount(0.8); //折扣
			orderItems.add(item); //添加item物件
		}
		orderBean.setItems(orderItems);  //將訂單明細加入訂單
//		orderItemDao.insertItems(orderItems); //新建訂單明細
		//資料庫新建一筆OrderBean訂單
		orderDao.insertOrder(orderBean); //新建訂單紀錄會一起新建orderItem紀錄
		
// 3. 清除使用者購物車表格紀錄
		cartBeanDao.deleteCartByMemberId(orderBean.getMemberBean().getMemberId());
	}
	
}
