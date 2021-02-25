package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entity.Member;
import com.example.demo.entity.Role;
import com.example.demo.service.MemberServiceImpl;

@RestController
public class AdminController {

	@Autowired
	MemberServiceImpl memberServiceImpl;
	
	@RequestMapping("/admin")
	public String admin() {
		
		return "這裡是管理員的頁面，只有管理員才能訪問";
		
	}
	
	
}
