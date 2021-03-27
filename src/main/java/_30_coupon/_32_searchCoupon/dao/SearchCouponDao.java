package _30_coupon._32_searchCoupon.dao;

import java.util.List;
import java.util.Map;

import _02_model.entity.CouponBean;

public interface  SearchCouponDao {
//	public List<Map<String,Object>> getCouponByCouponName(String coupon_Name);
	public List<CouponBean> getCouponByCouponName(String coupon_Name);

	
}
