package _50_shop._51_coupon.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.CouponBean;
import _02_model.entity.CouponUsedBean;
import _02_model.entity.ShopBean;
import _50_shop._51_coupon.dao.CouponDao;
import _50_shop._51_coupon.service.CouponService;



@Transactional
@Service
public class CouponServiceImpl implements Serializable, CouponService{
	
	@Autowired
	CouponDao couponDao;

	@Transactional
	@Override
	public CouponBean getCoupon(int couponId) {
		
		return couponDao.getCoupon(couponId);
	}
	
	public ShopBean getShop(int shopId){
		
		return couponDao.getShop(shopId);
	}
	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public int saveCoupon(CouponBean bean) {
		
		return couponDao.saveCoupon(bean);
	}

	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public List<CouponBean> getAllCoupons() {
		
		return couponDao.getAllCoupons();
	}
	
	@Transactional
	@Override
	public List<CouponBean> getShopCoupons(int shopId) {
		
		return couponDao.getShopCoupons(shopId);
	}
	
	@Transactional
	@Override
	public int updateCoupon(CouponBean bean) {
		
		return couponDao.updateCoupon(bean);
	}

	@Transactional
	@Override
	public int deleteCoupon(int couponId) {
		
		return couponDao.deleteCoupon(couponId);
	}
	

//        @Transactional
//	@Override
//	public List<Map<String, Object>>  queryCoupon(String queryCoupon) {
//		
//		return couponDao.queryCoupon(queryCoupon);
//	}


	@Transactional
	@Override
	public void saveCouponUsed(CouponUsedBean couponUsedBean){
		couponDao.saveCouponUsed(couponUsedBean);

	}
	
	

}
