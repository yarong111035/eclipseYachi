package _30_coupon;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import _02_model.entity.CouponBean;
import _10_member.entity.Member;
import _50_shop._51_coupon.service.CouponService;
//import _30_coupon._31_keepCoupon.service.CouponService;


@Controller
@SessionAttributes(value = {"coupon","allCoupon"})
public class Coupon_Controller {
	
	@Autowired
	ServletContext servletContext;
	
	// 不能使用JDK的動態代理注入，原因是jdk的動態代理不支援類注入，只支援介面方式注入;
	@Autowired 
	CouponService couponService;
	
	
	@RequestMapping("/vouchers_interface")
	public String vouchers_interface(Model model) {
		return "_15_coupon/vouchers_interface"; 
	}
	
	@RequestMapping("/vouchers")
	public String vouchers(Model model) {
		return "_15_coupon/vouchers"; 
	}
		
	
	
	//------------------------------------------------------
	// 測試查詢單筆優惠券
	@RequestMapping("/a")
	@ResponseBody
	public String vouchersTest1() {		
		CouponBean couponBean = couponService.getCoupon(1);		
		System.out.println(couponBean.getCoupon_name());
		
		return "測試成功"+couponBean.getCoupon_name(); 
	}
	
	
	// 測試查詢單筆優惠券並顯示圖片
	@RequestMapping("/aa")
	public String vouchersTest2(Model model) {
		
		CouponBean coupon = couponService.getCoupon(1);	
		model.addAttribute("coupon",coupon);
		
		return "_15_coupon/vouchers_Yi_Test"; 
	}
	
	
	// 測試查詢多筆優惠券
	@RequestMapping("/aaa")
	@ResponseBody
	public String vouchersTest3() {		
		
		List<CouponBean> allCoupon = couponService.getAllCoupons();
		Iterator<CouponBean> iterator = allCoupon.iterator();
		while(iterator.hasNext()) {
			System.out.println(iterator.next().getCoupon_name());
		}
				
		return "測試成功"; 
	}
	
	// 測試查詢多筆優惠券並顯示照片
	@RequestMapping("/aaaa")
	public String vouchersTest4(Model model) {		
		
		List<CouponBean> allCoupon = couponService.getAllCoupons();
		model.addAttribute("allCoupon",allCoupon);
				
		return "_15_coupon/vouchers_Yi_Test"; 
	}
	
	
	@GetMapping("/_00_init/getCouponImage")   
	public ResponseEntity<byte[]>  getMemberImage(@RequestParam("coupon_id") 
													Integer coupon_id) {
		InputStream is = null;
		OutputStream os = null;
		String fileName = null;
		String mimeType = null;
		byte[] media = null;
		ResponseEntity<byte[]> responseEntity = null;
		HttpHeaders headers = new HttpHeaders();
		MediaType mediaType = null;
		Blob blob = null;
		try {
			CouponBean couponBean = couponService.getCoupon(Integer.valueOf(coupon_id));
			if (couponBean != null) {
				blob = couponBean.getCoupon_pic();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = couponBean.getFile_name();
			}
			// 如果圖片的來源有問題，就送回預設圖片(/images/NoImage.png)	
			if (is == null) {
				fileName = "blank-profile.png" ; 
				is = servletContext.getResourceAsStream(
						"/data/images/" + fileName);
			}
			// 由圖片檔的檔名來得到檔案的MIME型態
			mimeType = servletContext.getMimeType(fileName);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			// 由InputStream讀取位元組，然後由OutputStream寫出
			int len = 0;
			byte[] bytes = new byte[8192];
			
			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}
			media = baos.toByteArray();
			mediaType = MediaType.valueOf(mimeType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			headers.setContentType(mediaType);
			responseEntity =  new ResponseEntity<>(media, headers, HttpStatus.OK);
		} catch(Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("_00_init.util.RetrieveBookImageServlet#doGet()發生Exception: " + ex.getMessage());
		} finally{
			try {
				if (is != null) is.close();
			} catch(IOException e) {
				;
			}
			try {
				if (os != null) os.close();
			} catch(IOException e) {
				;
			}
		}
		return responseEntity;
	}
	
	
}








