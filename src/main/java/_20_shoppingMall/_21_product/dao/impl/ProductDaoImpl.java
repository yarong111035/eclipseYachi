package _20_shoppingMall._21_product.dao.impl;



import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



import _02_model.entity.ProductBean;
import _02_model.entity.ProductTypeBean;
import _20_shoppingMall._21_product.dao.ProductDao;
import _20_shoppingMall._21_product.exception.ProductNotFoundException;



@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired  //從RootAppConfig LocalSessionFactoryBean() 注入 factory
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getAllProducts() {
		String hql = "FROM ProductBean";
		Session session = null;
//		List<ProductBean> list = new ArrayList<>();
		List<ProductBean> list = new LinkedList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		Collections.reverse(list);  //反轉新增順序，不知道效能好不好?
		return list;
		
//		可簡化:
//		String hql = "FROM BookBean";
//		Session session = factory.getCurrentSession();
//		return session.createQuery(hql).getResultList();
	}

	
	//更新產品價格
	@Override
	public void updatePrice(int productId, double newPrice) {
		String hql = "UPDATE ProductBean SET product_price = :newPrice WHERE product_id = :id";
		Session session = factory.getCurrentSession();		
		session.createQuery(hql)
			   .setParameter("newPrice", newPrice)
			   .setParameter("id", productId)
			   .executeUpdate();
	}

	//得到所有產品種類id(適用於直接在table裡的資料)
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductTypeBean> getAllSorts() {
		String hql = "SELECT DISTINCT p.productTypeBean FROM ProductBean p";
		Session session = factory.getCurrentSession();
		List<ProductTypeBean> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}


	//依據種類找到多筆產品
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductBySort(int sortId) {
//		pb.sort 的型態是 Product_sort，故還要.sortId，才能查詢 
		String hql = "FROM ProductBean pb WHERE pb.productTypeBean.product_type_id = :sortId";
		List<ProductBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("sortId", sortId).getResultList();
		return list;
	}
	
	

//  查詢單筆產品資料
	@Override
	public ProductBean getProductById(int productId) {
		Session session = factory.getCurrentSession();
		ProductBean pb = session.get(ProductBean.class, productId);
		if(pb == null) 
			throw new ProductNotFoundException("產品編號" + productId + " 查無此產品編號");
		return pb;
	}

//	新增產品(傳入ProductBean的物件)
	@Override
	public void addProduct(ProductBean product) {
		Session session = factory.getCurrentSession();
		//透過id找到對應的種類，因目前的sort是null(Debug模式可看出)
		//fk 不可以null 否則找不到對方(此處必須注意，否則會造成種類table的種類id=null)???
		ProductTypeBean ps = getSortById(product.getProduct_type_id());
//		Product_sort ps = getSortById((product.getSortId())); 
		product.setProductTypeBean(ps);; 
		session.save(product);
	}

//	依據sortId取得種類紀錄
	@Override
	public ProductTypeBean getSortById(int sortId) {
		ProductTypeBean ps = null;
		Session session = factory.getCurrentSession();
		ps = session.get(ProductTypeBean.class, sortId);
		return ps;
	}

// 取得所有種類
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductTypeBean> getSortList() {
		String hql = "From ProductTypeBean";
		Session session = factory.getCurrentSession();
		List<ProductTypeBean> list = session.createQuery(hql).getResultList();
		return list;
	}

}
