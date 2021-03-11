package _90_admin._93_editCoupon.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.AdminCouponBean;
import _02_model.entity.CouponBean;
import _90_admin._93_editCoupon.dao.editCouponDao;



@Repository
public class editCouponDaoImpl implements editCouponDao, Serializable{
	private static final long serialVersionUID = 1L;
	
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	editCouponDao editCouponDao;
	
	
	

	public editCouponDaoImpl() {
		
	}
	
	@Override
	public AdminCouponBean getAdminCoupon(int couponId) {
		Session session = factory.getCurrentSession();
		AdminCouponBean ac = session.get(AdminCouponBean.class, couponId);
		return ac;
	}

	@Override
	public int saveAdminCoupon(AdminCouponBean bean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(bean);
		n++;
		return n;
	}

	@Override
	public List<AdminCouponBean> getAllAdminCoupons() {
		List<AdminCouponBean> list = null;
		String hql = "FROM AdminCouponBean";
		Session session = factory.getCurrentSession();

		list = session.createQuery(hql).getResultList();
		return list;
	}

//	@Override
//	public List<AdminCouponBean> getShopCoupons(int shopId) {
//		List<AdminCouponBean> list = null;
//        Session session = factory.getCurrentSession();
//        String hql = "FROM AdminCouponBean ac WHERE ac.shopBean.shop_id = :sid";
//        list = session.createQuery(hql)
//        			  .setParameter("sid", shopId)
//        			  .getResultList();
//		return list;
//	}

	@Override
	public int updateAdminCoupon(AdminCouponBean bean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.update(bean);
		n++;
		return n;
	}

	@Override
	public int deleteAdminCoupon(int admincouponId) {
		int n = 0;
		Session session = factory.getCurrentSession();
		CouponBean ac = new CouponBean();
		ac.setCoupon_id(admincouponId);
		session.delete(ac);
		n++;
		return n;
	}

	

}
