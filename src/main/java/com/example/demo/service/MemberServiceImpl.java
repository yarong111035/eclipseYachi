package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDao;
import com.example.demo.entity.Member;
import com.example.demo.entity.Role;

@Service
public class MemberServiceImpl{
	
	@Autowired
	MemberDao memberDao;
	
	// 由帳號找會員
	public Member findUsername(String username) {
		return memberDao.findByUsername(username);
	}
	
	// 由id找會員
	public Member findByMemberId(Integer memberId) {
		
		return memberDao.findByMemberId(memberId);
	}


	// 將使用者寫入資料庫
	public void insertMember(Member member) {
		memberDao.save(member);
	}
	
	// 找會員的角色權限
	public List<Member> findByRolesIn(Set<Role> roles) {
		return memberDao.findByRolesIn(roles);
	}
	
}
