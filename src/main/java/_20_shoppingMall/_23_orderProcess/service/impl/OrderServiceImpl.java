package _20_shoppingMall._23_orderProcess.service.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _00_util.util.SystemUtils2018;
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
@Transactional
public class OrderServiceImpl implements OrderService {
	final Integer cancelStatus = 5;  //取消狀態碼
	final Integer unPayStatus = 1; //未付款狀態碼
	final Integer returnedStatus = 6; //退貨狀態碼
	
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
	public void createOrder(OrderBean orderBean) {
		
// 	 1. 新增訂單紀錄
		//狀態默認未付款
		OrderStatusBean OrderStatusBean = orderStatusDao.getStatusById(1);
		ShipTypeBean shipTypeBean = shipTypeDao.getShipTypeById(orderBean.getShipTypeBean().getShip_type_id());
		PayTypeBean payTypeBean = payTypeDao.getPayTypeById(orderBean.getPayTypeBean().getPay_type_id());
		
		//set OrderBean 外鍵欄位
		orderBean.setShipTypeBean(shipTypeBean);
		orderBean.setPayTypeBean(payTypeBean);
		orderBean.setOrderStatusBean(OrderStatusBean);
		
		//設定 訂單時間 與 配送日期
		Date nowDate = new Date();
		orderBean.setOrder_datetime(nowDate);//util.Date(當前訂單時間)
		long newTime = SystemUtils2018.addDate(nowDate, 3); //訂單日期往後推三天
		orderBean.setShipping_date(new java.sql.Date(newTime)); //sql.Date(配送日期)
		
// 	 2. 新增訂單明細紀錄(訂單細項:訂單 = 多 : 1)
		//取出"購物車商品"轉成"訂單明細"
		List<CartBean> carts = cartBeanDao.findCartByMemberId(orderBean.getMemberBean().getMemberId());
		Set<OrderItemBean> orderItems = new HashSet<>();
		for(CartBean cart : carts) {
			OrderItemBean item = new OrderItemBean();
			item.setOrderBean(orderBean); //放入訂單號碼
			item.setProductBean(cart.getProductBean()); //取得商品訊息
			item.setAmount(cart.getCart_amount()); //取得某項商品購買數量
			item.setUnitPrice(cart.getProductBean().getProduct_price());//商品單價
			item.setDiscount(0.8); //設置折扣(尚未計算折扣後金額)
			orderItems.add(item); //添加item物件
		}
		//將訂單明細加入訂單
		orderBean.setItems(orderItems);  
		//檢查訂單的每一筆明細的訂購量是否夠下單
		checkStock(orderBean);
		
		//資料庫新建一筆OrderBean訂單
		orderDao.insertOrder(orderBean); //新建訂單紀錄會一起新建orderItem紀錄
		//依照訂單id 配給訂單一個有序號碼
		orderDao.updateOrderNumberById(orderBean.getOrder_id());
		
// 	 3. 清除使用者購物車表格紀錄(也需要清除session的購物車紀錄)
		cartBeanDao.deleteCartByMemberId(orderBean.getMemberBean().getMemberId());
	}

	
	@Override
	public List<OrderBean> getAllOrdersByMemberId(Integer memberId) {
		List<OrderBean> list= orderDao.getAllOrdersByMemberId(memberId);
		return list;
	}


	@Override
	public OrderBean getOrderById(Integer orderNo) {
		OrderBean orderBean = orderDao.getOrderById(orderNo);
		return orderBean;
	}


	//檢查庫存量是否有超過訂購量
	@Override
	public void checkStock(OrderBean orderBean) {
		Set<OrderItemBean> items = orderBean.getItems();
		for(OrderItemBean item : items) {
			orderItemDao.updateProductStock(item);
		}
	}

	/**
	 * 取消訂單： 此兩步驟需同時成功或失敗，故在同一個交易中
	 * 1. 設定狀態為取消狀態
	 * 2. 加回已取消訂單細項的庫存數量
	 */

	@Override
	public void cancelOrder(OrderBean orderBean) {
		//判斷只有未付款才可以取消訂單
		if(orderBean.getOrderStatusBean().getStatus_id() == unPayStatus) {
			// 1. 設定狀態為取消狀態
			OrderStatusBean orderStatusBean = orderStatusDao.getStatusById(cancelStatus);
			orderBean.setOrderStatusBean(orderStatusBean);
			orderDao.updateOrderStatus(orderBean);
			
			// 2. 加回已取消訂單細項的庫存數量
			checkStock(orderBean);  //目前為取消狀態的orderBean
		}
	}


	



	
}
