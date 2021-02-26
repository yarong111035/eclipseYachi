package _10_member.dao.impl;



import java.util.List;
import java.util.Set;

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

		mBean = (Member)session.createQuery(hql)
				.setParameter("username", username)
				.getSingleResult();
		
		return mBean;
	}

	@Override
	public Member findByMemberId(Integer memberId) {
		Member mBean = null;
		Session session = factory.getCurrentSession();
		String hql  = "FROM Member m WHERE m.memberId = :memberId";

		mBean = (Member)session.createQuery(hql)
				.setParameter("memberId", memberId)
				.getSingleResult();
		
		return mBean;
	}

	@Override
	public Member insertMember(Member member) {
		Session session = factory.getCurrentSession();
		
		return (Member) session.save(member);
	}
	
}
