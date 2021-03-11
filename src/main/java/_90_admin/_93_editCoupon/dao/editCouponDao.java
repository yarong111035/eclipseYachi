package _90_admin._93_editCoupon.dao;

import java.util.List;

import _02_model.entity.AdminCouponBean;



public interface editCouponDao {

	AdminCouponBean getAdminCoupon(int admincoupon_id);
	
	int saveAdminCoupon (AdminCouponBean bean);
	
	List<AdminCouponBean> getAllAdminCoupons();
	
//	List<AdminCouponBean> getShopCoupons(int shopId);
	
	int updateAdminCoupon(AdminCouponBean bean);
	
	int deleteAdminCoupon(int admincoupon_id);

}
