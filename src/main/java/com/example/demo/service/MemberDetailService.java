package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.GrantedAuthoritiesContainer;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDao;
import com.example.demo.entity.Member;
import com.example.demo.entity.Role;

/*
 * 
 * UserDetailsService負責取得UserDetails物件
 * UserDetails存放使用者資訊，使用者登入後放入Authentication物件中
 * 
 * 
 * */
@Service
public class MemberDetailService implements UserDetailsService{
	
	@Autowired
	MemberServiceImpl memberServiceImpl;	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		
		Member member = memberServiceImpl.findUsername(username);
		
		if(member == null) {
			
			return null;  //由provider來拋出異常
		}
				
		Set<Role> roles = member.getRoles();
		List<String> list = new ArrayList<>();
			
		for (Role role : roles) {
			String role_code = role.getRole_code();
			list.add(role_code);
		}
		
		String[] permission = new String[list.size()];
		list.toArray(permission);

		UserDetails uDetails = User.withUsername(member.getUsername())
									.password(member.getPassword())
									.authorities(permission)
									.build();
		 
		System.out.println(uDetails);
		
		return uDetails;
	}
	
	
	
	
}
