//package _30_coupon._31_keepCoupon.dao;
//
//import java.util.List;
//
//import _02_model.entity.ProductBean;
//import _02_model.entity.ProductTypeBean;
//
//
//
//public interface ProductDao {
//	
//	//(lab3)
//	List<ProductBean> getAllProducts();
//	
//	//更新產品價格(lab4)
//	void updatePrice(int productId, double newPrice);
//	
//	//分類查詢產品資料(lab5)
//	List<ProductTypeBean> getAllSorts();
//	List<ProductBean> getProductBySort(int sortId);
//	
//	//查詢單筆產品資料(lab6)
//	public ProductBean getProductById(int productId);
//	
//	//新增產品資料(lab8)
//	public void addProduct(ProductBean product);
//	public ProductTypeBean getSortById(int sortId); 
//	List<ProductTypeBean> getSortList();
//	
//}
