package _10_member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import _10_member.entity.Member;
import _10_member.service.MemberService;



@Controller
@RequestMapping("/member")
public class MemberCenterController {
	
	@Autowired
	MemberService memberService;
		
	// 會員修改資料
	@GetMapping("/update/{memberId}")
	public String update(@PathVariable Integer memberId,Model model) {
		
		
		return "/_11_member/member_update";
	}
	

	@ModelAttribute("member")
	public Member editMember(
		 @PathVariable(value="memberId", required = false) Integer memberId
			) {
		System.out.println("@ModelAttribute修飾的方法執行中");
		Member member = null;
		if (memberId != null) {		
			member = memberService.findByMemberId(memberId);						
			System.out.println("在@ModelAttribute修飾的方法 讀到物件:" + member);
		} else {
			member = new Member();
			System.out.println("在@ModelAttribute修飾的方法 無法讀取物件:" + member);
		}
		return member;
	}
}
