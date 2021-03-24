package _80_home.dao;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.CouponBean;
import _02_model.entity.NightMarketBean;
import _02_model.entity.ProductBean;
import _02_model.entity.ProductTypeBean;
import _02_model.entity.ShopBean;
import _02_model.entity.ShopTypeBean;

@Repository
public class SearchDao{
	
	@Autowired
	SessionFactory factory;
	
	// Like模糊搜尋夜市 
	@SuppressWarnings("unchecked")
	public List<NightMarketBean> searchNight(String market_name){
		
		Session session = factory.getCurrentSession();
		
		String hql = "From NightMarketBean n Where n.market_name LIKE :name "; 
		
		List<NightMarketBean> list = session.createQuery(hql)
											.setParameter("name","%"+market_name+"%")
											.getResultList();		
		return list;
	}
	
	
	// 查詢所有的優惠券 (優惠券有效期限大於當前時間) 尚未過期
	@SuppressWarnings("unchecked")
	public List<CouponBean> getAllCouponNoExpired() {
		
		Session session = factory.getCurrentSession();
		
		Date date = Calendar.getInstance().getTime();
		String hql = "FROM CouponBean c Where c.coupon_end >= :date";
		
		List<CouponBean> list = session.createQuery(hql).setParameter("date", date)
														.getResultList();
		
		return list;
	}
	
	// 查詢所有的商品  --> 顯示商城全部的商品 
	@SuppressWarnings("unchecked")
	public List<ProductBean> getALLProducts() {

		Session session = factory.getCurrentSession();

		String hql = "from ProductBean p ";
		List<ProductBean> list = session.createQuery(hql).getResultList();
		
		return list;
	}
	
	
	// 測試查詢所有的商品 --> 依商品名稱
	@SuppressWarnings("unchecked")
	public List<ProductBean> getAllProductsByName(String product_name) {
		
		Session session = factory.getCurrentSession();
				
		String hql = "from ProductBean p where p.product_name LIKE :pName"; 
		
		List<ProductBean> list = session.createQuery(hql)
										.setParameter("pName", "%"+product_name+"%")
										.getResultList();
		
		return list;
	}
	
	// 查詢所有的商品 --> 依特定的商品名稱   商品價格由大至小排列
	@SuppressWarnings("unchecked")
	public List<ProductBean>  getAllProductsByHighPrice(String product_name) {
		
		Session session = factory.getCurrentSession();
				
		String hql = "from ProductBean p where p.product_name LIKE :pName ORDER BY p.product_price DESC";

		List<ProductBean> list = session.createQuery(hql).setParameter("pName", "%"+product_name+"%")
														 .getResultList();

		
		return list;
		
	}
	
	// 查詢所有的商品 --> 依特定的商品名稱   商品價格由小至大排列
	@SuppressWarnings("unchecked")
	public List<ProductBean> getAllProductsByLowPrice(String product_name) {
		
		Session session = factory.getCurrentSession();
	
		String hql = "from ProductBean p where p.product_name LIKE :pName ORDER BY p.product_price ASC";

		List<ProductBean> list = session.createQuery(hql).setParameter("pName", "%"+product_name+"%")
														 .getResultList();
		
		return list;

	}

	// 查詢所有的商品 --> 依特定的商品名稱 依使用者輸入商品價格低 ~ 到商品價格高
	@SuppressWarnings("unchecked")
	public List<ProductBean> getAllProductsByBetweenPrice(String product_name,Double lowPrice,Double highPrice) {
		
		Session session = factory.getCurrentSession();
	
		String hql = "from ProductBean p WHERE p.product_name LIKE :pName and p.product_price BETWEEN :low AND :high";
		
		List<ProductBean> list = session.createQuery(hql)
										.setParameter("pName", "%"+product_name+"%")
										.setParameter("low", lowPrice)
										.setParameter("high", highPrice)
										.getResultList();
		return list;
	}

	// 查詢所有的商品 --> 依照最新上架的日期
	@SuppressWarnings("unchecked")
	public List<ProductBean> getReleaseNewProduct() {
		
		Session session = factory.getCurrentSession();
		
		String hql = "from ProductBean p ORDER BY p.product_release DESC";
		
		List<ProductBean> list = session.createQuery(hql).getResultList();
		
		
		return list;
	}
	
	// 查詢所有的商品 --> 依照商品的類型
	public Set<ProductBean> getProductTypeBean(Integer product_type_id) {
		
		Session session = factory.getCurrentSession();
				
		ProductTypeBean typeBean = session.get(ProductTypeBean.class, product_type_id);
		Set<ProductBean> products = typeBean.getProducts();
		
		return products;
	}

	// 查詢所有的商家 --> 依商家名稱
	@SuppressWarnings("unchecked")
	public List<ShopBean> getAllShopByName(String shop_name) {
		
		Session session = factory.getCurrentSession();
				
		String hql = "from ShopBean s where s.shop_name LIKE :sname";
		
		List<ShopBean> list = session.createQuery(hql)
								     .setParameter("sname", "%"+shop_name+"%")
								     .getResultList();
		return list;
	}

	// 依商家的類型找出所有的商家 
	public Set<ShopBean> getAllShopBean(Integer shop_type_id) {
		
		Session session = factory.getCurrentSession();
		
		ShopTypeBean shopTypeBean = session.get(ShopTypeBean.class, shop_type_id);
		
		Set<ShopBean> shops = shopTypeBean.getShops();
		
		return shops;
	}

	
}












