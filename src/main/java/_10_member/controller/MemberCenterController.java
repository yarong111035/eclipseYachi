package _10_member.controller;


import java.sql.Blob;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import _10_member.entity.Member;
import _10_member.service.MemberService;



@Controller
@RequestMapping("/member")
public class MemberCenterController {
	
	@Autowired
	MemberService memberService;
		
	// 會員修改資料頁面渲染
	@GetMapping("/update/{memberId}")
	public String update(@PathVariable Integer memberId) {
		
		
		return "/_11_member/member_update";
	}
	
	// 會員修改資料表單提交
	@PostMapping("/update/{memberId}")
	public String update(Member member){
	
		MultipartFile picture = member.getMemberMultipartFile();
		String originalFilename = picture.getOriginalFilename();
		
		String ext = "";
		if (originalFilename.lastIndexOf(".") > -1) {
			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		}
		
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			member.setFileName(originalFilename);
		}
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				member.setImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
		memberService.updateMember(member);
		
		return "redirect:/index";
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
