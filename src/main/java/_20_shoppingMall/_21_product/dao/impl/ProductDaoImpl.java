package _20_shoppingMall._21_product.dao.impl;



import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _00_util.util.GlobalService;
import _02_model.entity.ProductBean;
import _02_model.entity.ProductTypeBean;
import _20_shoppingMall._21_product.dao.ProductDao;
import _20_shoppingMall._21_product.dao.ProductTypeDao;
import _20_shoppingMall._21_product.exception.ProductNotFoundException;



@Repository
public class ProductDaoImpl implements Serializable,ProductDao {
	private static final long serialVersionUID = 1L;

	@Autowired  //從RootAppConfig LocalSessionFactoryBean() 注入 factory
	SessionFactory factory;
	
	@Autowired
	ProductTypeDao productTypeDao;
	
	private int recordsPerPage = GlobalService.RECORDS_PER_PAGE; // 預設值：每頁五筆
	private int totalPages = -1;
	
	String selected = "";
	
	
	
	public ProductDaoImpl() {
		super();
	}

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
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<ProductTypeBean> getAllSorts() {
//		String hql = "SELECT DISTINCT p.productTypeBean FROM ProductBean p";
//		Session session = factory.getCurrentSession();
//		List<ProductTypeBean> list = new ArrayList<>();
//		list = session.createQuery(hql).getResultList();
//		return list;
//	}


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
		ProductTypeBean ps = productTypeDao.getSortById(product.getProductTypeBean().getProduct_type_id());
//		Product_sort ps = getSortById((product.getSortId())); 
		product.setProductTypeBean(ps);; 
		session.save(product);
	}

//	依據sortId取得種類紀錄
//	@Override
//	public ProductTypeBean getSortById(int sortId) {
//		ProductTypeBean ps = null;
//		Session session = factory.getCurrentSession();
//		ps = session.get(ProductTypeBean.class, sortId);
//		return ps;
//	}

// 取得所有種類
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<ProductTypeBean> getSortList() {
//		String hql = "From ProductTypeBean";
//		Session session = factory.getCurrentSession();
//		List<ProductTypeBean> list = session.createQuery(hql).getResultList();
//		return list;
//	}

//	取得資料庫裡產品表格裡的產品數量
	@Override
	public long getRecordCounts() {
		long count = 0; // 必須使用 long 型態
		String hql = "SELECT count(*) FROM ProductBean";
		Session session = factory.getCurrentSession();
		count = (Long)session.createQuery(hql).getSingleResult();
		return count;
	}

	@Override
	public int getTotalPages() {
		// 注意下一列敘述的每一個型態轉換
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		return totalPages;
	}
	
	@Override
	public int getRecordsPerPage() {
		return recordsPerPage;
	}

	public void setRecordsPerPage(int recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
	}

//	設定每一頁出現的產品
	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, ProductBean> getPageProducts(int pageNo) {
		Map<Integer, ProductBean> map = new LinkedHashMap<>(); //有排序(last in last out)
		String hql = "FROM ProductBean";
		Session session = factory.getCurrentSession();
		int startRecordNo = (pageNo - 1) * recordsPerPage; //得到每一頁開始的產品索引
		List<ProductBean> list = session.createQuery(hql)  //只要從資料庫撈此頁需要的紀錄即可，index從0開始
										.setFirstResult(startRecordNo) // 從第n筆開始
										.setMaxResults(recordsPerPage) // 取五筆資料
										.getResultList();
//      將 list 轉成 Map 物件
		for(ProductBean productBean : list) {
			map.put(productBean.getProduct_id(), productBean);
		}
		return map;
	}
	
	@Override
	public void setSelected(String selected) {
		this.selected = selected;
	}

	@Override
	public void deleteProduct(Integer product_id) {
		Session session = factory.getCurrentSession();
		ProductBean productBean = session.get(ProductBean.class, product_id);
		if(productBean != null) {
			productBean.setProduct_type_id(null);//要把外鍵卸掉才可以刪除此筆紀錄
			session.delete(productBean);
		}
	}

	@Override
	public void updateProduct(ProductBean productBean) {
		if(productBean != null && productBean.getProduct_id() != null) {
			Session session = factory.getCurrentSession();
			//fk 不可以null 否則找不到對方(此處必須注意，否則會造成種類table的種類id=null)???
//			productBean.setProductTypeBean(ps);
//			ProductTypeBean ps = productBean.getProductTypeBean();
			ProductTypeBean ps = productTypeDao.getSortById(productBean.getProductTypeBean().getProduct_type_id());
//			productBean.setProductTypeBean(session.get(ProductTypeBean.class, productBean.getProductTypeBean().getProduct_type_id()));
			productBean.setProductTypeBean(ps);
//			System.out.println("=========" + productBean.getProduct_type_id());
			session.saveOrUpdate(productBean);
		}
	}



}