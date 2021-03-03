package _10_member.dao;


import _10_member.entity.Member;


public interface MemberDao {

		
	public Member findByUsername(String username);
	
	public Member findByMemberId(Integer memberId);
	
	public Object insertMember(Member member);
	
}	