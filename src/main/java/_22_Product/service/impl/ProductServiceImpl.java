package _22_Product.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _02_model.entity.ProductBean;
import _02_model.entity.Product_sort;
import _22_Product.dao.ProductDao;
import _22_Product.service.ProductService;


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
	public List<Product_sort> getAllSorts() {
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
	public Product_sort getSortById(int sortId) {
		return dao.getSortById(sortId);
	}
	
	@Transactional
	@Override
	public List<Product_sort> getSortList() {
		return dao.getSortList();
	}

}
