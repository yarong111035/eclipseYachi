package com.example.demo.controller;

import java.security.Principal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.entity.Member;
import com.example.demo.entity.Role;
import com.example.demo.service.MemberServiceImpl;

@Controller
public class LoginAndRegisterController {
	
	@Autowired
	MemberServiceImpl memberServiceImpl;
	
	@Autowired
	PasswordEncoder pEncoder;
	
	
	@RequestMapping("/LoginAndRegister")
	public String LoginAndRegister(@ModelAttribute("member") Member member) {
		
		return "LoginAndRegister"; 
	}
	
	
	@RequestMapping("/login-view")
	public String login_register(@ModelAttribute("member") Member member ,Model model) {
			
		model.addAttribute("accountError", "帳號或密碼有錯誤 ! ");
		
		return "LoginAndRegister"; 
	}
		
	
	@PostMapping("doRegister")
	public String doRegist(@Valid @ModelAttribute("member") Member member,
			BindingResult bindingResult,Model model) {
		
		if (bindingResult.hasErrors()) {
			
			return "errorRegister";
		}
			
		// 獲取來自輸入表單的帳號和密碼
		String username = member.getUsername();
		String password = member.getPassword();
		// 從資料庫找尋帳號是否有和輸入表單帳號重複的 
		Member getUsername = memberServiceImpl.findUsername(username);
		
		if(getUsername != null) {
			
			model.addAttribute("msg","註冊失敗");
			model.addAttribute("errorInfo",username);
			
			return "success";
			
		}else {
			
			Role roleA = new Role();
			roleA.setRole_name("會員");
			roleA.setRole_code("USER");
			
			Set<Role> roles = new HashSet<>();
			roles.add(roleA);			
			member.setRoles(roles);
			
			// 註冊時間戳記
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Timestamp timestampNow = Timestamp.valueOf(dateFormat.format(timestamp));
			member.setRegisterTime(timestampNow);
			
			member.setPassword(pEncoder.encode(password));
			memberServiceImpl.insertMember(member);
			model.addAttribute("msg","註冊成功");
			System.out.println(member);
			
			return "success";
		}
		
	}
	
	// 登入成功後的畫面 	
	@RequestMapping("/success")
	public String success(HttpSession session,Model model) {
		
		String name = SecurityContextHolder.getContext()
				.getAuthentication().getName();
		Member member = memberServiceImpl.findUsername(name);	
		
		model.addAttribute(member);
		session.setAttribute("LoginOK",member.getFullname());
		
		return "/success";
		
		//return "redirect:/";
	}
	
	 // 會員登出
	@RequestMapping("/doLogout")
	public String doLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	// <form action="/doLogin" method="POST">
//	@PostMapping("doLogin") 
//	public String doLogin(Member member,Model model,HttpSession session) {
//		
//		// 獲取來自輸入表單的帳號密碼
//		String username = member.getUsername();
//		String password = member.getPassword();
//		
//		// 依來自表單的帳號密碼去尋找有無和資料庫相符合的帳號密碼
//		// 如果返回 null 表示查無此人
//		// Member memberValidation = memberServiceImpl.getMember(account,password);
//		
//		// 依輸入表單的帳號獲取來自資料庫會員的全部資料
//		Member memberInfo = memberServiceImpl.findUsername(username);
//		
//		if (memberInfo == null) {
//
//			model.addAttribute("accountError", "查無帳號，請先去註冊");
//			
//			return "LoginAndRegister";			
//		}
//		
//		String sqlPassword = memberInfo.getPassword();		
//	    if (!password.equals(sqlPassword)){
//
//			model.addAttribute("passwordError", "密碼錯誤");
//			
//			return "LoginAndRegister";
//		}
//	    
//		// 登入成功 	
//		session.setAttribute("LoginOK", memberInfo);	
//		System.out.println(memberInfo);
//		
//		return "redirect:/";
//
//	}
	
	
}


