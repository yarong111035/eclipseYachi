package _20_shoppingMall._21_product.service.impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _02_model.entity.ProductBean;
import _02_model.entity.ProductTypeBean;
import _20_shoppingMall._21_product.dao.ProductDao;
import _20_shoppingMall._21_product.service.ProductService;


@Service
public class ProductServiceImpl implements ProductService {
	@Autowired //透過容器自動注入，不需要自己new
	ProductDao dao;
	
	@Transactional
	@Override
	public List<ProductBean> getAllProducts() {
		return dao.getAllProducts();
	}
	
	@Transactional
	@Override
	public void updateAllPrice() {
		List<ProductBean> allProducts = dao.getAllProducts();
		for(ProductBean pb : allProducts) {
			if(pb.getProduct_price() != null && pb.getProduct_price() < 300) {
				dao.updatePrice(pb.getProduct_id(), pb.getProduct_price() + 50); //300元以下全部漲價100元
			}
		}
		
	}

	@Transactional
	@Override
	public List<ProductTypeBean> getAllSorts() {
		return dao.getAllSorts();
	}

	@Transactional
	@Override
	public List<ProductBean> getProductBySort(int sortId) {
		return dao.getProductBySort(sortId);
	}

//	查詢單品產品資料
	@Transactional
	@Override
	public ProductBean getProductById(int productId) {
		return dao.getProductById(productId);
	}

	@Transactional
	@Override
	public void addProduct(ProductBean product) {
		dao.addProduct(product);
		
	}
	
	//存入種類到產品
	@Transactional
	@Override
	public ProductTypeBean getSortById(int sortId) {
		return dao.getSortById(sortId);
	}
	
	@Transactional
	@Override
	public List<ProductTypeBean> getSortList() {
		return dao.getSortList();
	}

	
	//每一分頁顯示的產品
	@Transactional
	@Override
	public Map<Integer, ProductBean> getPageProducts(int pageNo) {
		Map<Integer, ProductBean> map = null;
		map = dao.getPageProducts(pageNo);
		return map;
	}

//	得所有記錄總數
	@Override
	public long getRecordCounts() {
		return dao.getRecordCounts();
	}

//	得每一頁產品數量
	@Override
	public int getRecordsPerPage() {
		return dao.getRecordsPerPage();
	}

//	得所有頁數數量
	@Transactional
	@Override
	public int getTotalPages() {
		int allPagesCount = 0;
		allPagesCount = dao.getTotalPages();
		return allPagesCount;
	}

//	設定每一頁的產品數量
	@Override
	public void setRecordsPerPage(int recordsPerPage) {
		dao.setRecordsPerPage(recordsPerPage);
	}

	@Override
	public void setSelected(String selected) {
		dao.setSelected(selected);
	}

	@Transactional
	@Override
	public void deleteProduct(Integer product_id) {
		dao.deleteProduct(product_id);
	}

}
