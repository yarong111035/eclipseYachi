package _10_member.service;

import _10_member.entity.Member;

public interface MemberService {

	public Member findByUsername(String username);
	
	public Member findByMemberId(Integer memberId);
	
	public Member findByCode(String code);

	
	public Object insertMember(Member member);
	
	public void updateMember(Member member); 

}
