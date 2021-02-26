package _10_member.dao;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Repository;

import _10_member.entity.Member;
import _10_member.entity.Role;


public interface MemberDao {

		
	public Member findByUsername(String username);
	
	public Member findByMemberId(Integer memberId);
	
	public Member insertMember(Member member);
	
}	