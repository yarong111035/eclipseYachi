package _50_shop._53_shopRegister.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.ShopTypeBean;
import _50_shop._53_shopRegister.dao.ShopTypeDao;



@Repository
public class ShopTypeDaoImpl implements Serializable, ShopTypeDao{
	private static final long serialVersionUID = 1L;
	private int id = 0;
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	ShopTypeDao shopTypeDao;
	
	
	

	public ShopTypeDaoImpl() {
	}


	
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopTypeBean> getShopType() {
		String hql = "FROM ShopTypeBean";
		Session session = factory.getCurrentSession();
		
		List<ShopTypeBean> list = session.createQuery(hql).getResultList();
		
		return list;
	}

}
