package com.web.store.dao.impl;



import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.dao.ProductDao;
import com.web.store.model.BookBean;
import com.web.store.model.CompanyBean;
import com.web.store.model.ProductBean;
import com.web.store.model.Product_sort;


@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired  //從RootAppConfig LocalSessionFactoryBean() 注入 factory
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getAllProducts() {
		String hql = "FROM ProductBean";
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
		
//		可簡化:
//		String hql = "FROM BookBean";
//		Session session = factory.getCurrentSession();
//		return session.createQuery(hql).getResultList();
	}

	
	//更新產品價格
	@Override
	public void updatePrice(int productId, int newPrice) {
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
	public List<Product_sort> getAllSorts() {
		String hql = "SELECT DISTINCT p.sort FROM ProductBean p";
		Session session = factory.getCurrentSession();
		List<Product_sort> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}


	//依據種類找到多筆產品
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductBySort(int sortId) {
//		pb.sort 的型態是 Product_sort，故還要.sortId，才能查詢 
		String hql = "FROM ProductBean pb WHERE pb.sort.sortId = :sortId";
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
		return pb;
	}

//	新增產品(傳入ProductBean的物件)
	@Override
	public void addProduct(ProductBean product) {
		Session session = factory.getCurrentSession();
		//透過id找到對應的種類，因目前的sort是null(Debug模式可看出)
		//fk 不可以null 否則找不到對方(此處必須注意，否則會造成種類table的種類id=null)???
		Product_sort ps = getSortById((product.getSortId())); 
		product.setSort(ps);; 
		session.save(product);
	}

//	依據sortId取得種類紀錄
	@Override
	public Product_sort getSortById(int sortId) {
		Product_sort ps = null;
		Session session = factory.getCurrentSession();
		ps = session.get(Product_sort.class, sortId);
		return ps;
	}

// 取得所有種類
	@SuppressWarnings("unchecked")
	@Override
	public List<Product_sort> getSortList() {
		String hql = "From Product_sort";
		Session session = factory.getCurrentSession();
		List<Product_sort> list = session.createQuery(hql).getResultList();
		return list;
	}

}
