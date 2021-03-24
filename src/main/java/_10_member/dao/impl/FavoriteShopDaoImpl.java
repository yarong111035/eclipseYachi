package _10_member.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.FavoriteShopListBean;
import _10_member.dao.FavoriteShopDao;
import _10_member.dao.MemberDao;

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

}
