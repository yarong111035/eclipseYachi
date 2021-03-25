package _10_member.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.CouponBean;
import _02_model.entity.FavoriteCouponListBean;
import _02_model.entity.FavoriteShopListBean;
import _02_model.entity.ShopBean;
import _10_member.dao.FavoriteShopDao;
import _10_member.dao.MemberDao;
import _10_member.entity.Member;

@Repository
public class FavoriteShopDaoImpl implements Serializable, FavoriteShopDao{
private static final long serialVersionUID = 1L;
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	FavoriteShopDao favoriteShopDao;
	
	@Autowired
	MemberDao memberDao;
	
	@Override
	public int saveFavoriteShop(FavoriteShopListBean favoriteShopListBean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(favoriteShopListBean);
		n++;
		return n;
	}

	@Override
	public int updateFavoriteShop(FavoriteShopListBean favoriteShopListBean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.update(favoriteShopListBean);
		n++;
		return n;
	}

	@Override
	public List<FavoriteShopListBean> getFavoriteShopByMemberId(Integer memberId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM FavoriteShopListBean WHERE memberBean.memberId = :mid";
		
		@SuppressWarnings("unckecked")
		List<FavoriteShopListBean> fslb = session.createQuery(hql).setParameter("mid", memberId).getResultList();
		return fslb;
	}

	
	@Override
	public void saveFavoriteShop2(Integer memberId, Integer shopBean_id) {
		
		Session session = factory.getCurrentSession();

		ShopBean shopBean = session.get(ShopBean.class, shopBean_id);
		
		Member member = session.get(Member.class, memberId);
		
		String hql = "FROM FavoriteShopListBean WHERE memberBean.memberId = :mid";
		
		FavoriteShopListBean favoriteShopListBean = new FavoriteShopListBean();
		
		try {
			favoriteShopListBean = (FavoriteShopListBean) session.createQuery(hql)
												.setParameter("mid", member.getMemberId())
												.getSingleResult();
		} catch (Exception e) {

		}
								
		if ( favoriteShopListBean.getShop_list_id() == null) {
			
			// 新創建一個Set 將一個一個優惠券集合成Set
			Set<ShopBean> shopBeans = new LinkedHashSet<ShopBean>();			
			shopBeans.add(shopBean);
			
			// 該會員第一次收藏優惠券才需要創建 FavoriteCouponListBean
			FavoriteShopListBean fsb = new FavoriteShopListBean();

			fsb.setMemberBean(member);
			fsb.setShops(shopBeans);
			
			session.persist(fsb);
			
		}else {
			
			// 該會員想要再次收藏其他的優惠券 	
			Set<ShopBean> shopBeans = new HashSet<ShopBean>();
			
			shopBeans = favoriteShopListBean.getShops();
			shopBeans.add(shopBean);
			
			favoriteShopListBean.setShops(shopBeans);
			
			session.update(favoriteShopListBean);
						
		}
		
	}

}
