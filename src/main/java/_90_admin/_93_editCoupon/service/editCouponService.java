package _90_admin._93_editCoupon.service;

import java.util.List;

import _02_model.entity.AdminCouponBean;


public interface editCouponService {
	
	AdminCouponBean getAdminCoupon(int admincouponId);
	
	int saveAdminCoupon (AdminCouponBean bean);
	
	List<AdminCouponBean> getAllAdminCoupons();
	
	List<AdminCouponBean> getShopCoupons(int shopId);
	
	int updateAdminCoupon(AdminCouponBean bean);
	
	int deleteAdminCoupon(int admincouponId);


}
