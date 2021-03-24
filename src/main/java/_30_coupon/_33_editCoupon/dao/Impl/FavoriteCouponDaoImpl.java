package _30_coupon._33_editCoupon.dao.Impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.CouponBean;
import _02_model.entity.FavoriteCouponListBean;
import _30_coupon._33_editCoupon.dao.FavoriteCouponDao;

@Repository
public class FavoriteCouponDaoImpl implements FavoriteCouponDao{
	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	FavoriteCouponDao favoriteCouponDao;
	
	@Override
	public int saveFavoriteCoupon(FavoriteCouponListBean favoriteCouponListBean) {
		int n = 0;
		Session session = sessionFactory.getCurrentSession();
		session.save(favoriteCouponListBean);
		n++;
		return n;
	}
	
	@Override
	public int updateFavoriteCoupon(FavoriteCouponListBean favoriteCouponListBean) {
		int n = 0;
		Session session = sessionFactory.getCurrentSession();
		session.update(favoriteCouponListBean);
		n++;
		return n;
	}
	
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<FavoriteCouponListBean> getFavoriteCouponByMemberId(Integer memberId) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "FROM FavoriteCouponListBean  WHERE memberBean.memberId = :mid";
        
        	List<FavoriteCouponListBean> fslb = session.createQuery(hql)
            			  .setParameter("mid", memberId)
            			  .getResultList();   
		return fslb;
	}
	

	@Override
	public void deleteSingleFavoriteCouponByMemberId(Integer memberId, Integer coupon_id ) {
		
        Session session = sessionFactory.getCurrentSession();
        
		CouponBean cp = session.get(CouponBean.class, coupon_id);
 
		String hql = "FROM FavoriteCouponListBean WHERE memberBean.memberId = :mid";
		
		FavoriteCouponListBean favoriteCouponListBean = new FavoriteCouponListBean();
		
		try {
			favoriteCouponListBean = (FavoriteCouponListBean) session.createQuery(hql)
												.setParameter("mid", memberId)
												.getSingleResult();
		} catch (Exception e) {

		}	
		Set<CouponBean> coupons = new HashSet<CouponBean>();
		coupons = favoriteCouponListBean.getCoupons();		
		coupons.remove(cp);		
		favoriteCouponListBean.setCoupons(coupons);
		
		session.update(favoriteCouponListBean);
		
	}
	
	
	
}
