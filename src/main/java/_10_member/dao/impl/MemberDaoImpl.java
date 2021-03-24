package _10_member.dao.impl;



import java.util.List;
import java.util.Set;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import _10_member.dao.MemberDao;
import _10_member.entity.Member;
import _10_member.entity.Role;


@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	SessionFactory factory;

	@Override
	public Member findByUsername(String username) {
		Member mBean = null;
		Session session = factory.getCurrentSession();
		String hql  = "FROM Member m WHERE m.username = :username";
		try {
			mBean = (Member)session.createQuery(hql)
					.setParameter("username", username)
					.getSingleResult();		
		} catch (NoResultException e) {
			return mBean;
		}
		
		return mBean;
	}

	@Override
	public Member findByMemberId(Integer memberId) {
		Member mBean = null;
		Session session = factory.getCurrentSession();
		String hql  = "FROM Member m WHERE m.memberId = :memberId";

		try {
			mBean = (Member)session.createQuery(hql)
					.setParameter("memberId", memberId)
					.getSingleResult();
			
		} catch (NoResultException e) {
			return mBean;
		}
		
		return mBean;
	}

	// 新增會員
	@Override
	public Object insertMember(Member member) {
		Session session = factory.getCurrentSession();
		
		return session.save(member);
	}

	// 更新會員
	@Override
	public void updateMember(Member member) {
		
		Session session = factory.getCurrentSession();
		session.update(member);
		
	}

	@Override
	public Member findByCode(String code) {
		
		Member mBean = null;
		Session session = factory.getCurrentSession();
		String hql  = "FROM Member m WHERE m.code = :code";

		try {
			mBean = (Member)session.createQuery(hql)
					.setParameter("code", code)
					.getSingleResult();
			
		} catch (NoResultException e) {
			return mBean;
		}
		
		return mBean;
	}

	
}
