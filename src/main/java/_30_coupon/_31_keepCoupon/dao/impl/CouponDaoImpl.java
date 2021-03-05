//package _30_coupon._31_keepCoupon.dao.impl;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import _02_model.entity.ProductBean;
//import _02_model.entity.ProductTypeBean;
//import _30_coupon._31_keepCoupon.dao.ProductDao;
//
//@Repository
//public class ProductDaoImpl implements ProductDao {
//	@Autowired  //從RootAppConfig LocalSessionFactoryBean() 注入 factory
//	SessionFactory factory;
//	
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<ProductBean> getAllProducts() {
//		String hql = "FROM ProductBean";
//		Session session = null;
//		List<ProductBean> list = new ArrayList<>();
//		session = factory.getCurrentSession();
//		list = session.createQuery(hql).getResultList();
//		return list;
//		
////		可簡化:
////		String hql = "FROM BookBean";
////		Session session = factory.getCurrentSession();
////		return session.createQuery(hql).getResultList();
//	}
//
//	
//	//更新產品價格
//	@Override
//	public void updatePrice(int productId, double newPrice) {
//		String hql = "UPDATE ProductBean SET product_price = :newPrice WHERE product_id = :id";
//		Session session = factory.getCurrentSession();		
//		session.createQuery(hql)
//			   .setParameter("newPrice", newPrice)
//			   .setParameter("id", productId)
//			   .executeUpdate();
//	}
//
//	//得到所有產品種類id(適用於直接在table裡的資料)
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<ProductTypeBean> getAllSorts() {
//		String hql = "SELECT DISTINCT p.productTypeBean FROM ProductBean p";
//		Session session = factory.getCurrentSession();
//		return session.createQuery(hql).getResultList();
//	}

	
	//更新產品價格
