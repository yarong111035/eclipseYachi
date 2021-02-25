package com.example.demo._20_shoppingMall._21_product.service;

import java.util.List;

import com.example.demo._02_entity.ProductBean;
import com.example.demo._02_entity.Product_sort;


public interface ProductService {
	
	//lab3
	List<ProductBean> getAllProducts();
	
	//更新產品價格(lab4)
	void updateAllPrice();
	
	//依據種類找產品(lab5)
	public List<Product_sort> getAllSorts();
	public List<ProductBean> getProductBySort(int sortId);
	
	//查詢單筆產品資料(lab6)
	public ProductBean getProductById(int productId);
	
	//新增產品(lab8)
	public void addProduct(ProductBean product);
	public Product_sort getSortById(int sortId);
	public List<Product_sort> getSortList();
}
