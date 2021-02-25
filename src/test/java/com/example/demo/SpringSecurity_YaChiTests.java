package com.example.demo;

import java.util.HashSet;
import java.util.Set;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.demo.entity.Member;
import com.example.demo.entity.Role;
import com.example.demo.service.MemberServiceImpl;


@SpringBootTest
class SpringSecurity_YaChiTests {

	@Autowired
	MemberServiceImpl memberServiceImpl;
	
	@Test
	public void test() {
		
		Member memberA = new Member();
		memberA.setUsername("a");
		memberA.setFullname("大雄");
		
		Role roleA = new Role();
		roleA.setRole_name("會員");
		roleA.setRole_code("USER");
		
		Role roleB = new Role();
		roleB.setRole_name("管理員");
		roleB.setRole_code("ADMIN");
		
		Set<Role> roles = new HashSet<>();
		roles.add(roleA);
		roles.add(roleB);
		
		memberA.setRoles(roles);
	
		// Save至資料庫
		memberServiceImpl.insertMember(memberA);
		
	}
}
