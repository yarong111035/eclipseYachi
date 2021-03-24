package _10_member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _10_member.dao.MemberDao;
import _10_member.entity.Member;
import _10_member.service.MemberService;

@Transactional
@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao memberDao;
	
	
	@Override
	public Member findByUsername(String username) {
		
		return memberDao.findByUsername(username);
	}

	@Override
	public Member findByMemberId(Integer memberId) {
		
		return memberDao.findByMemberId(memberId);
	}

	@Override
	public Object insertMember(Member member) {
		
		return memberDao.insertMember(member);
	}

	@Override
	public void updateMember(Member member) {
		memberDao.updateMember(member);
	}

	@Override
	public Member findByCode(String code) {
		
		return memberDao.findByCode(code);
	}

}
