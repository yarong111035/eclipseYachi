package _50_shop._51_coupon.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.CouponBean;
import _50_shop._51_coupon.dao.CouponDao;



@Repository
public class CouponDaoImpl implements CouponDao, Serializable{
	private static final long serialVersionUID = 1L;
	
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	CouponDao couponDao;
	
	
	

	public CouponDaoImpl() {
		
	}
	
	@Override
	public CouponBean getCoupon(int couponId) {
		Session session = factory.getCurrentSession();
		CouponBean cb = session.get(CouponBean.class, couponId);
		return cb;
	}

	@Override
	public int saveCoupon(CouponBean bean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(bean);
		n++;
		return n;
	}

	@Override
	public List<CouponBean> getAllCoupons() {
		List<CouponBean> list = null;
		String hql = "FROM CouponBean";
		Session session = factory.getCurrentSession();

		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public List<CouponBean> getShopCoupons(int shopId) {
		List<CouponBean> list = null;
        Session session = factory.getCurrentSession();
        String hql = "FROM CouponBean cb WHERE cb.shopBean.shop_id = :sid";
        list = session.createQuery(hql)
        			  .setParameter("sid", shopId)
        			  .getResultList();
		return list;
	}

	@Override
	public int updateCoupon(CouponBean bean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.update(bean);
		n++;
		return n;
	}

	@Override
	public int deleteCoupon(int couponId) {
		int n = 0;
		Session session = factory.getCurrentSession();
		CouponBean cb = new CouponBean();
		cb.setCoupon_id(couponId);
		session.delete(cb);
		n++;
		return n;
	}

	

}
