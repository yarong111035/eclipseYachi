package _90_admin._93_editCoupon.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.AdminCouponBean;
import _02_model.entity.AdminCouponTypeBean;
import _02_model.entity.CouponBean;
import _50_shop._51_coupon.dao.CouponDao;
import _50_shop._51_coupon.service.CouponService;
import _90_admin._93_editCoupon.dao.editCouponDao;
import _90_admin._93_editCoupon.service.editCouponService;



@Transactional
@Service
public class editCouponServiceImpl implements Serializable, editCouponService{
	
	@Autowired
	editCouponDao admincoupondao;

	@Transactional
	@Override
	public AdminCouponBean getAdminCoupon(int admincouponId) {
		
		return admincoupondao.getAdminCoupon(admincouponId);
	}

	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public int saveAdminCoupon(AdminCouponBean bean) {
		
		return admincoupondao.saveAdminCoupon(bean);
	}

	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public List<AdminCouponBean> getAllAdminCoupons() {
		
		return admincoupondao.getAllAdminCoupons();
	}
	
	
	@Transactional
	@Override
	public int updateAdminCoupon(AdminCouponBean bean) {
		
		return admincoupondao.updateAdminCoupon(bean);
	}

	@Transactional
	@Override
	public int deleteAdminCoupon(int admincouponId) {
		
		return admincoupondao.deleteAdminCoupon(admincouponId);
	}
	
//	@Transactional
//	@Override
//	public List<AdminCouponBean> getShopCoupons(int shopId) {
//		return admincoupondao.getShopCoupons(shopId);
//	}

	@Override
	public List<AdminCouponTypeBean> getAllSorts() {
		return admincoupondao.getAllSorts();
	}

	@Override
	public AdminCouponTypeBean getTypeById(int typeId) {
		return admincoupondao.getTypeById(typeId);
	}

	@Override
	public List<AdminCouponTypeBean> getSortList() {
		return admincoupondao.getSortList();
	}




	

}
