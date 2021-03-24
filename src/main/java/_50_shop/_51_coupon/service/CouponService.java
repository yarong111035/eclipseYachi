package _50_shop._51_coupon.service;

import java.util.List;

import _02_model.entity.CouponBean;
import _02_model.entity.CouponUsedBean;
import _02_model.entity.ShopBean;



public interface CouponService {
	
	CouponBean getCoupon(int couponId);
	
	public ShopBean getShop(int shopId);
	
	int saveCoupon (CouponBean bean);
	
	List<CouponBean> getAllCoupons();
	
	List<CouponBean> getShopCoupons(int shopId);
	
	int updateCoupon(CouponBean bean);
	
	int deleteCoupon(int couponId);

//	public List<Map<String, Object>>  queryCoupon(String queryCoupon);

	public void saveCouponUsed(CouponUsedBean couponUsedBean);

}
