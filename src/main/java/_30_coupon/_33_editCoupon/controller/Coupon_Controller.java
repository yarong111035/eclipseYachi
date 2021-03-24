package _30_coupon._33_editCoupon.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _02_model.entity.CouponBean;
import _02_model.entity.CouponUsedBean;
import _02_model.entity.ShopBean;
import _10_member.entity.Member;
import _10_member.service.MemberService;
import _30_coupon._33_editCoupon.service.FavoriteCouponService;
import _50_shop._51_coupon.service.CouponService;
import _80_home.service.SearchService;


@Controller
@SessionAttributes(value = { "coupon", "allCoupon", "LoginOK" })
public class Coupon_Controller {

//@Controller呼叫@Service呼叫@Repository(Dao)
	@Autowired
	CouponService couponService;
	
	@Autowired
	MemberService  memberService;

	@Autowired
	ServletContext context;

	@Autowired
	SessionFactory factory;
	@Autowired
	FavoriteCouponService favoriteCouponService;
//	=============================== 優惠劵 ============================================

	@RequestMapping("/coupons")
	public String list(Model model) {
		List<CouponBean> list = couponService.getAllCoupons();
		model.addAttribute("coupons", list);
		return "_15_coupon/coupons";
	}
//	=============================== 優惠劵介面 ============================================

	@RequestMapping("/coupon")
	public String getCouponById(@RequestParam("coupon_id") Integer coupon_id,
//								@RequestParam("memberId") Integer memberId,
			Model model) {
		model.addAttribute("coupon", couponService.getCoupon(coupon_id));
//		model.addAttribute("member", service.getMemberById(memberId));
		return "_15_coupon/coupon";
	}
	
//	=============================== 會員收藏優惠券 ============================================
	@GetMapping("/addfavorite/add/{coupon_Id}")
	public String addfavorite(Model model, @PathVariable Integer coupon_Id) {
		Member mb = (Member) model.getAttribute("LoginOK");
		try {
			favoriteCouponService.saveFavoriteCoupon(couponService.getCoupon(coupon_Id), mb);
		} catch (Exception e) {
			return "redirect:/coupons";
		}

		return "redirect:/coupons";
	}
	
//	=============================== 紅豆餅介面 ============================================

	@RequestMapping("/RedBean_pies")
	public String RedBean_pies(Model model) {
		return "_15_coupon/RedBean_pies";
	}
	
//	=============================== 吐司介面 ============================================

	@RequestMapping("/bread")
	public String bread(Model model) {
		return "_15_coupon/bread";
	}
	
//	 =============================== 使用優惠券 ============================================
			@GetMapping("/useCoupon/{coupon_Id}")
			public String useCoupon(Model model, @PathVariable Integer coupon_Id) {
				CouponBean couponBean = couponService.getCoupon(coupon_Id);
				
//				System.out.println(couponBean.getShopBean());
				
				Integer shop_id = couponBean.getShopBean().getShop_id();
				ShopBean shopBean = couponService.getShop(shop_id);
//				ShopBean shopBean = couponBean.getShopBean();
				Member mb = (Member) model.getAttribute("LoginOK");
				Timestamp coupon_used_time = new Timestamp(System.currentTimeMillis());
				
				
//				System.out.println("============================controller=======================" );
//				System.out.println("coupon_Id=== " + coupon_Id);
//				System.out.println("couponBean=== " + couponBean);
//				System.out.println("mb=== " + mb);
//				System.out.println("shopBean=== " + shopBean);
//				System.out.println("========================controller==========================" );
				Integer amount = couponBean.getCoupon_amount();
				System.out.println("amount====" + amount);
				if(amount > 0) {
					CouponUsedBean couponUsedBean = new CouponUsedBean();
					couponUsedBean.setCouponBean(couponBean);
					couponUsedBean.setMemberBean(mb);
					couponUsedBean.setShopBean(shopBean);
					couponUsedBean.setCoupon_used_time(coupon_used_time);
					
					couponService.saveCouponUsed(couponUsedBean);
				}else {
					
				}
				
				return "redirect:/coupons";
			}
//		=============================== 查詢優惠劵 ============================================
			@Autowired
			SearchService searchService;
			
			
			@RequestMapping("/searchCoupons")
			public String sCoupons(@RequestParam String coupon_name,Model model) {
				
				List<CouponBean> list = searchService.getAllCouponNoExpired(coupon_name);
				
				model.addAttribute("coupons", list);

				
				return "_15_coupon/coupons";
			}
			
			
	
////	=============================== 查詢優惠劵 ============================================
//	@GetMapping(value = "/queryCoupon", 
//		      produces = { "application/json; charset=UTF-8" })
//	public @ResponseBody List<CouponBean> queryCoupon(Model model, 
//			@RequestParam(value = "queryCoupon_name", defaultValue = "輸入查詢優惠劵") String queryCoupon_name) {	
////		Map<String, CouponBean> map = new HashMap<>();
////		@SuppressWarnings("unchecked")
////		Map<String, String> map2 = (Map<String, String>) couponService.queryCoupon(queryCoupon_name);
//		List<CouponBean> couponDetail = couponService.queryCoupon2(queryCoupon_name);
//				
//		//----------------------------------------------
////		model.addAttribute("couponDetail",couponDetail);
//		
////		map.put("couponDetail",list);
//		//---------------------------------------------
//		
////		map.put("couponDetail",couponService.queryCoupon(queryCoupon_name));
//		return couponDetail;
////		List<Map<String,Object>> list = couponService.queryCoupon(queryCoupon_name);
////	 	model.addAttribute("result", couponService.queryCoupon(queryCoupon_name));
////	 	return "redirect:/coupons";
//	}
//	
//	=============================== 搜尋優惠劵 ============================================
//	@PostMapping(value = "/queryCoupon")
//	public String queryCoupon(Model model,
//			@RequestParam(value = "queryString") String queryString) {
//		System.out.println("queryString" + queryString);
//			
//		List<Map<String,Object>> querylist = couponService.queryCoupon(queryString);
//			model.addAttribute("querylist", querylist);
//			System.out.println("=============================last=====================================" );
//
//			return "_15_coupon/queryCoupon";
//		}

	
	
//	=============================== 轉圖檔 ============================================

	@RequestMapping(value = "/getCouponPicture/{coupon_Id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer coupon_Id) {
		String filePath = "/images/coupon/nonepic.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		CouponBean bean = couponService.getCoupon(coupon_Id);
		if (bean != null) {
			Blob blob = bean.getCoupon_pic();
			filename = bean.getFile_name(); // 照片的檔案名稱
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

}
