package _20_shoppingMall._21_product.service.impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _02_model.entity.ProductBean;
import _02_model.entity.ProductTypeBean;
import _20_shoppingMall._21_product.dao.ProductDao;
import _20_shoppingMall._21_product.dao.ProductTypeDao;
import _20_shoppingMall._21_product.service.ProductService;


@Service
public class ProductServiceImpl implements ProductService {
	@Autowired //透過容器自動注入，不需要自己new
	ProductDao productDao;
	
	@Autowired
	ProductTypeDao productTypeDao;
	
	public ProductServiceImpl() {
		super();
	}

	@Transactional
	@Override
	public List<ProductBean> getAllProducts() {
		return productDao.getAllProducts();
	}
	
	@Transactional
	@Override
	public void updateAllPrice() {
		List<ProductBean> allProducts = productDao.getAllProducts();
		for(ProductBean pb : allProducts) {
			if(pb.getProduct_price() != null && pb.getProduct_price() < 300) {
				productDao.updatePrice(pb.getProduct_id(), pb.getProduct_price() + 50); //300元以下全部漲價100元
			}
		}
		
	}

//	@Transactional
//	@Override
//	public List<ProductTypeBean> getAllSorts() {
//		return dao.getAllSorts();
//	}

	@Transactional
	@Override
	public List<ProductBean> getProductBySort(int sortId) {
		return productDao.getProductBySort(sortId);
	}

//	查詢單品產品資料
	@Transactional
	@Override
	public ProductBean getProductById(int productId) {
		return productDao.getProductById(productId);
	}

	@Transactional
	@Override
	public void addProduct(ProductBean product) {
		ProductTypeBean ps = productTypeDao.getTypeById(product.getProductTypeBean().getProduct_type_id());
		product.setProductTypeBean(ps);
		product.setProduct_type_id(ps.getProduct_type_id());
		System.out.println("=====================" + product + "==============");
		productDao.addProduct(product);
		
	}
	
	
	
	
//	//存入種類到產品
//	@Transactional
//	@Override
//	public ProductTypeBean getSortById(int sortId) {
//		return dao.getSortById(sortId);
//	}
	
//	@Transactional
//	@Override
//	public List<ProductTypeBean> getSortList() {
//		return dao.getSortList();
//	}

	
	//每一分頁顯示的產品
	@Transactional
	@Override
	public Map<Integer, ProductBean> getPageProducts(int pageNo) {
		Map<Integer, ProductBean> map = null;
		map = productDao.getPageProducts(pageNo);
		return map;
	}

//	得所有記錄總數
	@Override
	public long getRecordCounts() {
		return productDao.getRecordCounts();
	}

//	得每一頁產品數量
	@Override
	public int getRecordsPerPage() {
		return productDao.getRecordsPerPage();
	}

//	得所有頁數數量
	@Transactional
	@Override
	public int getTotalPages() {
		int allPagesCount = 0;
		allPagesCount = productDao.getTotalPages();
		return allPagesCount;
	}

//	設定每一頁的產品數量
	@Override
	public void setRecordsPerPage(int recordsPerPage) {
		productDao.setRecordsPerPage(recordsPerPage);
	}

	@Override
	public void setSelected(String selected) {
		productDao.setSelected(selected);
	}

	//刪除產品
	@Transactional
	@Override
	public void deleteProduct(Integer product_id) {
		productDao.deleteProduct(product_id);
	}
	
	//更新產品
	@Transactional
	@Override
	public void updateProduct(ProductBean productBean) {
		ProductTypeBean productTypeBean = productTypeDao.getTypeById(productBean.getProductTypeBean().getProduct_type_id());
		productBean.setProductTypeBean(productTypeBean);
		productBean.setProduct_type_id(productTypeBean.getProduct_type_id()); //未set進去
		System.out.println(productBean);
		productDao.updateProduct(productBean);
	}

}
