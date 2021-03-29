package _10_member.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _10_member.entity.Member;
import _10_member.entity.Role;
import _10_member.mail.Garbled;
import _10_member.mail.MailUtil;
import _10_member.mail.PwdMail;
import _10_member.service.MemberService;
import _10_member.validate.MemberValidator;
import _10_member.validate.PasswordValidator;
import _20_shoppingMall._22_shoppingCart.service.CartBeanService;
import _20_shoppingMall._22_shoppingCart.vo.MemberCartBeanVo;
import _20_shoppingMall._22_shoppingCart.vo.SessionCartVo;

@Controller
@SessionAttributes({ "LoginOK", "AdminLoginOK","sessionCartVoList","memberCartVoList"})
public class LoginAndRegisterController {

	@Autowired
	MemberService memberService;

	@Autowired
	MemberValidator mValidator;
	
	@Autowired
	PasswordValidator pwdValidator;
	
	@Autowired
	PasswordEncoder pEncoder;

	@Autowired
	CartBeanService cartBeanService;

	// 登入和註冊頁面的視圖邏輯名稱渲染
	@RequestMapping("/LoginAndRegister")
	public String LoginAndRegister(Model model) {

		// <form:form modelAttribute="member">
		// 先送出空白表單
		model.addAttribute("member", new Member());

		return "/_11_member/LoginAndRegister";
	}

	// 會員註冊事務
	@PostMapping("doRegister")
	public String doRegist(Member member, BindingResult bindingResult, Model model, HttpSession session, RedirectAttributes ra) {

		mValidator.validate(member, bindingResult);

		if (bindingResult.hasErrors()) {

			return "/_11_member/errorRegister";
		}

		// 獲取來自輸入表單的帳號和密碼
		String username = member.getUsername();
		String password = member.getPassword();

		// 從資料庫找尋帳號是否有和輸入表單帳號重複的
		Member getUsername = memberService.findByUsername(username);

		if (getUsername != null) {

			model.addAttribute("msg", "註冊失敗");
			model.addAttribute("errorInfo", username);

			return "/_11_member/errorRegister";

		} else {

			// ---------寄送信箱驗證
			Garbled garbled = new Garbled();
			String code = garbled.getGalbled(8);
			member.setCode(code);
			new Thread(new MailUtil(member.getEmail(), code)).start();

			// <c:if test="${empty status and !empty code }">
			// alert(" 已寄出驗證信 登入前請先去驗證 !");
//			model.addAttribute("status", member.getStatus());
//			model.addAttribute("code", member.getCode());
			ra.addFlashAttribute("status", member.getStatus());
			ra.addFlashAttribute("code", member.getCode());
			ra.addFlashAttribute("confirmMail",member.getEmail());

			// ------------------------------------------------------
			// 加入會員角色
			Role roleA = new Role();
			roleA.setRole_name("會員");
			roleA.setRole_code("USER");

//			// 註冊管理員請自行打開註解
//			Role roleA = new Role();
//			roleA.setRole_name("管理員");
//			roleA.setRole_code("ADMIN");

			Set<Role> roles = new HashSet<>();
			roles.add(roleA);
			member.setRoles(roles);

			// 註冊時間戳記
			member.setRegisterTime(new Timestamp(System.currentTimeMillis()));

			// 密碼加密處理
			member.setPassword(pEncoder.encode(password));

			memberService.insertMember(member);

			return "redirect:/";
		}

	}

	// 驗證信箱控制器
	@RequestMapping("/emailConfirm/code={code}")
	public String ConfirmEmail(@PathVariable String code) {

		Member member = memberService.findByCode(code);
		member.setStatus(1);
		memberService.updateMember(member);

		return "/_11_member/MailVerification";
	}
	

	// 會員登出
	@RequestMapping("/doLogout")
	public String doLogout(HttpSession session, SessionStatus status) {

		session.invalidate();

		// 去除@SessionAttributes("LoginOK")以及其他屬性物件
		status.setComplete();

		return "redirect:/home";
	}

	// 會員登入
	@PostMapping("doLogin")
	public String doLogin(Member member, Model model, HttpSession session, HttpServletRequest request) {

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
		if (!matches) {

			model.addAttribute("passwordError", "密碼錯誤");

			return "/_11_member/LoginAndRegister";
		}

		// ----判斷是否為管理員登入

		Set<Role> roles = member.getRoles();
		String role_code = null;
		Iterator<Role> iterator = roles.iterator();
		while (iterator.hasNext()) {
			role_code = iterator.next().getRole_code();
		}

		if (role_code.contains("ADMIN")) {
			System.out.println("你是管理員");
			member.setStatus(1);
			memberService.updateMember(member);
			model.addAttribute("AdminLoginOK", member);

			return "redirect:/";
		}

		// --------------------------------------------------------------
		Integer status = member.getStatus();
		if (status == null) {

			model.addAttribute("emailError", "信箱尚未驗證");

			return "/_11_member/LoginAndRegister";

		}

		String nextPath = (String) session.getAttribute("requestURI");
		if (nextPath == null) {

			// 如果nextPath等於null 則導向 "/" 首頁
			 nextPath = request.getContextPath();

			// 如果nextPath等於null 則導向index
			//nextPath = request.getContextPath() + "/index";
		}

		// 清除 status code 識別字串 這個跟信箱有關係
		session.invalidate();

		// 登入成功 將用戶存入session中 識別字串為"LoginOK" 屬性物件為 member
		// 當 model.addAttribute("LoginOK",member); 時
		// @SessionAttributes("LoginOK") 會自動幫你存入Session
		model.addAttribute("LoginOK", member); // request

		
		// 訪客登入成功 (sessionCart => CartBean)
		// 1. 先取得sessionCart的購物清單
		@SuppressWarnings("unchecked")
		List<SessionCartVo> sessionCartVoList = (List<SessionCartVo>) model.getAttribute("sessionCartVoList");
		if (sessionCartVoList != null) {
			// 2. 利用 SessionCartVo 創建購物車
			for (SessionCartVo sessionCart : sessionCartVoList) {
				cartBeanService.addToCart(member.getMemberId(), sessionCart.getProduct_id(), sessionCart.getScQty());
			}

		}
		List<MemberCartBeanVo> memberCartVoList = cartBeanService.getMemberCartVo(member.getMemberId());
		model.addAttribute("memberCartVoList", memberCartVoList);
		//--------------------------------------------------------------------------------

		return "redirect: " + nextPath;
	}

	// 避免出現以下的例外
	// org.springframework.web.HttpSessionRequiredException: Expected session
	// attribute 'member'
//	@ModelAttribute("member")
//		public Member populateForm() {
//		    return new Member();
//	}

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
	
	
	
	
	//---------------------會員忘記密碼寄信處理流程
	// 會員忘記密碼
	@RequestMapping("/forgetPassword")
	public String resetPassword(Model model) {

		// 先送出空白表單
		model.addAttribute("member", new Member());
		
		return "/_11_member/findMemberPwd";
	}
	
	// 會員輸入email寄信找回密碼  //表單輸入盡量不要加action /反斜線
	@PostMapping("findPwd")
	public String findPwd(Member member,BindingResult bindingResult,Model model
			,RedirectAttributes ra) {
		
		// 獲取來自輸入表單的帳號密碼
		String username = member.getUsername();
		String email = member.getEmail();
		
		// 依輸入表單的帳號獲取來自資料庫會員的全部資料
		member = memberService.findByUsername(username);

		if (member == null) {
			model.addAttribute("accountError", "查無帳號，請先去註冊");
			return "/_11_member/findMemberPwd";
		}
		boolean equals = email.equals(member.getEmail());
		if(equals == false) {
			model.addAttribute("emailError", "查無信箱，麻煩再輸入一次");
			return "/_11_member/findMemberPwd";
		}
		
		// ---------寄送信箱更改密碼
//		Garbled garbled = new Garbled();
//		String code = garbled.getGalbled(8);
//		member.setCode(code);
		new Thread(new PwdMail(member.getEmail(), member.getCode())).start();
		
		
		ra.addFlashAttribute("sendMail",member.getEmail());
		
		
		return "redirect:/home";
	}
	
	// 會員更改密碼信箱控制器
//	@RequestMapping("/emailConfirm/editMember={code}")
//	public String ConfirmEditEmail(@PathVariable String code) {
//
//		return "redirect:/editMemberPwd";
//	}
//	
//	// 會員更改密碼頁面的渲染
//	@RequestMapping("/editMemberPwd")
//	public String editPassword(Model model) {	
//		
////		// 先送出空白表單
//		model.addAttribute("member", new Member());	
//		
//		
//		
//		return "/_11_member/editMemberPwd";
//	}
	
	//---------------------------3/29 - 1233
	@RequestMapping("/emailConfirm/editMember={code}")
	public String ConfirmEditEmail(@PathVariable String code) {

		return "redirect:/editMemberPwd/"+code;
	}
	
	// 會員更改密碼頁面的渲染
	@RequestMapping("/editMemberPwd/{code}")
	public String editPassword(Model model,@PathVariable String code) {	
			
		 Member member = memberService.findByCode(code);
		
		// 先送出空白表單
		 Member member1 = new Member();
		 member1.setUsername(member.getUsername());
		 model.addAttribute("member", member1);	
		
		
		
		return "/_11_member/editMemberPwd";
	}
	
	//---------------------------3/29 - 1233
	
	// 提交會員更改密碼表單
	@PostMapping("/editMemberPwd/{code}")
	public String lastEditpwd(Member member,Model model,BindingResult bindingResult
			,RedirectAttributes ra) {
		
		
		pwdValidator.validate(member, bindingResult);
		
		if(bindingResult.hasErrors()) {
			
			return "/_11_member/editMemberPwd";
		}
		
		// 獲取來自輸入表單的帳號密碼
		String username = member.getUsername();
		String password = member.getPassword();
		String newpassword = member.getNewpassword();
		
		// 依輸入表單的帳號獲取來自資料庫會員的全部資料
		member = memberService.findByUsername(username);
		
		if (member == null) {
			
			model.addAttribute("accountError", "查無帳號，請先去註冊");
			
			return "/_11_member/editMemberPwd";
		}
		
		ra.addFlashAttribute("editsuccess",member.getFullname());
		
		// 密碼加密處理
		member.setPassword(pEncoder.encode(newpassword));

 		memberService.updateMember(member);
	
		
 		return "redirect:/LoginAndRegister";
	}
	
	//---------------------會員忘記密碼寄信處理流程結束

}
