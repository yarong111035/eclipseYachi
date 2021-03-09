package _10_member.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;

import _10_member.entity.Member;
import _10_member.entity.Role;
import _10_member.service.MemberService;
import _10_member.validate.MemberValidator;


@Controller
@SessionAttributes("LoginOK")
public class LoginAndRegisterController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MemberValidator mValidator;
	
	@Autowired
	PasswordEncoder pEncoder;
	
	// 登入和註冊頁面的視圖邏輯名稱渲染
	@RequestMapping("/LoginAndRegister")
	public String LoginAndRegister(@ModelAttribute("member") Member member) {
		
		return "/_11_member/LoginAndRegister"; 
	}
			
	// 會員註冊事務
	@PostMapping("doRegister")
	public String doRegist(@ModelAttribute("member") Member member,
			BindingResult bindingResult,Model model,HttpSession session) {
		
		mValidator.validate(member, bindingResult);
		
		if (bindingResult.hasErrors()) {
			
			return "/_11_member/errorRegister";
		}
			
		// 獲取來自輸入表單的帳號和密碼
		String username = member.getUsername();  //aa
		String password = member.getPassword();

		// 從資料庫找尋帳號是否有和輸入表單帳號重複的 
		Member getUsername = memberService.findByUsername(username);  //aa
				
		if(getUsername != null ) {
			
			model.addAttribute("msg","註冊失敗");
			model.addAttribute("errorInfo",username);
			
			return "/_11_member/errorRegister";
			
		}else {
			
			Role roleA = new Role();
			roleA.setRole_name("會員");
			roleA.setRole_code("USER");
			
			Set<Role> roles = new HashSet<>();
			roles.add(roleA);			
			member.setRoles(roles);
			
			// 註冊時間戳記
			member.setRegisterTime(new Timestamp(System.currentTimeMillis()));
			
			// 密碼加密處理
			member.setPassword(pEncoder.encode(password));

			memberService.insertMember(member);
//			System.out.println(member);			
//			session.setAttribute("member", member);	
//			model.addAttribute("member", member);
			
			model.addAttribute("LoginOK", member);
			
			return "redirect:/index";
		}
		
	}
	
	// 登入成功後的畫面 	
//	@RequestMapping("/success")
//	public String success(HttpSession session,Model model,Member member) {
//		
//		String name = member.getFullname();
//		
//		member = memberService.findByUsername(name);	
//		
//		model.addAttribute(member);
//		session.setAttribute("LoginOK",member.getFullname());
//		
//		return "/_11_member//success";
//		
//	}
	
	 // 會員登出
	@RequestMapping("/doLogout")
	public String doLogout(HttpSession session, SessionStatus status) {
		
		session.invalidate();
		
		// 去除@SessionAttributes("LoginOK")
		status.setComplete();
		
		
		return "redirect:/index";
	}
	
	
	// 會員登入
	@PostMapping("doLogin") 
	public String doLogin(Member member,Model model,HttpSession session,
							HttpServletRequest request) {
		
		// 獲取來自輸入表單的帳號密碼
		String username = member.getUsername();
		String password = member.getPassword();
		
		// 依來自表單的帳號密碼去尋找有無和資料庫相符合的帳號密碼
		// 如果返回 null 表示查無此人
		// Member memberValidation = memberServiceImpl.getMember(account,password);
		
		// 依輸入表單的帳號獲取來自資料庫會員的全部資料
		member = memberService.findByUsername(username);
		
		if (member == null) {
			model.addAttribute("accountError", "查無帳號，請先去註冊");		
			return "/_11_member/LoginAndRegister";			
		}
		
		String sqlPassword = member.getPassword();
		boolean matches = pEncoder.matches(password, sqlPassword);
	    if (!matches){

			model.addAttribute("passwordError", "密碼錯誤");
			
			return "/_11_member/LoginAndRegister";
		}
	    
		String nextPath = (String)session.getAttribute("requestURI");
		if (nextPath == null) {
			
			// 如果nextPath等於null 則導向 "/" 首頁
			// nextPath = request.getContextPath();
			
			// 如果nextPath等於null 則導向index
			nextPath = request.getContextPath()+"/index";  
		}
		
		// 登入成功 將用戶存入session中 識別字串為"member" 屬性物件為 member
		// session.setAttribute("member", member);  //session
		model.addAttribute("LoginOK",member);     //request
		
		
		return "redirect: " + nextPath;
	}
	
	// 避免出現以下的例外
	// org.springframework.web.HttpSessionRequiredException: Expected session attribute 'member'
	@ModelAttribute("member")
	public Member populateForm() {
	    return new Member();
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder, WebRequest request) {
		// java.util.Date 1995-19-48 27:90:100
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		dateFormat.setLenient(false);
		CustomDateEditor ce = new CustomDateEditor(dateFormat, true);
		binder.registerCustomEditor(Date.class, ce);
		// java.sql.Date
		DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat2.setLenient(false);
		CustomDateEditor ce2 = new CustomDateEditor(dateFormat2, true);
		binder.registerCustomEditor(java.sql.Date.class, ce2);
	}

}


