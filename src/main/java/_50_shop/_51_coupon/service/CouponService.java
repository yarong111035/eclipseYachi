package _50_shop._51_coupon.service;

import java.util.List;

import _02_model.entity.CouponBean;



public interface CouponService {
	
	CouponBean getCoupon(int couponId);
	
	int saveCoupon (CouponBean bean);
	
	List<CouponBean> getAllCoupons();
	
	List<CouponBean> getShopCoupons(int shopId);
	
	int updateCoupon(CouponBean bean);
	
	int deleteCoupon(int couponId);


}
