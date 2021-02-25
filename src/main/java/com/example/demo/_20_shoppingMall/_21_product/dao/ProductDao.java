package com.example.demo._20_shoppingMall._21_product.dao;

import java.util.List;

import com.example.demo._02_entity.ProductBean;
import com.example.demo._02_entity.Product_sort;


public interface ProductDao {
	
	//(lab3)
	List<ProductBean> getAllProducts();
	
	//更新產品價格(lab4)
	void updatePrice(int productId, int newPrice);
	
	//分類查詢產品資料(lab5)
	List<Product_sort> getAllSorts();
	List<ProductBean> getProductBySort(int sortId);
	
	//查詢單筆產品資料(lab6)
	public ProductBean getProductById(int productId);
	
	//新增產品資料(lab8)
	public void addProduct(ProductBean product);
	public Product_sort getSortById(int sortId); 
	List<Product_sort> getSortList();
	
}
