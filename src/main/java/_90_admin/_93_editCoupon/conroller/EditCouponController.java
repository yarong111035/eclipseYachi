package _90_admin._93_editCoupon.conroller;

import java.sql.Blob;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _02_model.entity.AdminCouponBean;
import _10_member.entity.Member;
import _90_admin._93_editCoupon.service.editCouponService;

@Controller
@RequestMapping("/admin")
@SessionAttributes({ "LoginOK","admincouponList"})
public class EditCouponController {

	@Autowired
	editCouponService editcouponService;

	@Autowired
	ServletContext context;

//	表單頁面控制器方法
//	@GetMapping("/admin_coupon")
//	public String getAddNewProductFormString(Model model) {
//		AdminCouponBean ac = new AdminCouponBean();
//		ac.setAdmincoupon_name("全店滿兩百折三十");
//		ac.setAdmincoupon_rule("消費每兩百元可使用一張");
//		ac.setAdmincoupon_amount(30);
//		Date utilDate = new Date();
//		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
//		ac.setAdmincoupon_begin(sqlDate);
//		ac.setAdmincoupon_consumption(400);
//		ac.setAdmincoupon_discount(60);
//		model.addAttribute("AdminCouponBean", ac); 
//		return "_16_admin/admin_coupon";
//	}
	
	//管理員首頁
	
	@RequestMapping("/administrator")
	public String administrator(Model model) {  
		model.getAttribute("admincouponList");  //需把"admincouponList"加到這個model裡才會正確顯示
		return "_16_admin/administrator"; 
	}
	
	@GetMapping("modifyAdminCoupon/{admincouponId}")
	public String showUpdateForm(Model model, @PathVariable Integer admincouponId) {
		AdminCouponBean admincouponBean = editcouponService.getAdminCoupon(admincouponId);
		model.addAttribute("AdminCouponBean", admincouponBean);
		return "_16_admin/admin/administrator";
	}

	@PostMapping("modifyAdminCoupon/{admincouponId}")
	public String updateForm(@ModelAttribute AdminCouponBean bean, Model model, BindingResult result,
			RedirectAttributes redirectAttributes, @PathVariable Integer admincouponId) {
		long sizeInBytes = -1;
		MultipartFile picture = bean.getAdmincoupon_image();
		if (picture.getSize() == 0) {
			AdminCouponBean original = editcouponService.getAdminCoupon(admincouponId);
			bean.setAdmincoupon_pic(original.getAdmincoupon_pic());
			bean.setAdminfile_name(original.getAdminfile_name());
		} else {
			sizeInBytes = picture.getSize();
			String originalFilename = picture.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				bean.setAdminfile_name(originalFilename);
			}
			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					bean.setAdmincoupon_pic(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}
		bean.setAdmincoupon_id(admincouponId);
		Member ac = (Member) model.getAttribute("LoginOK");
//		bean.setShopBean(mb.getShopBean());
		editcouponService.updateAdminCoupon(bean);

		return "redirect:/admin_coupon";
	}

	@GetMapping("deleteAdminCoupon/{admincouponId}")
	public String deleteAdminCoupon(@PathVariable Integer admincouponId) {
		editcouponService.deleteAdminCoupon(admincouponId);
		return "redirect:/admin_coupon";
	}

	@GetMapping("/InsertAdminCoupon")
	public String sendingEmptyForm(Model model, HttpSession session) {
		Member ac = (Member) model.getAttribute("LoginOK");
//		Member mb = (Member) session.getAttribute("member");
//		int shopId = ac.getShopBean().getShop_id();
		AdminCouponBean acb = new AdminCouponBean();
		acb.setAdmincoupon_amount(5);
		model.addAttribute("AdminCouponBean", acb);
		List<AdminCouponBean> admincoupons = editcouponService.getAllAdminCoupons();
		model.addAttribute("admincouponList",admincoupons);
		return "/_16_admin/admin_coupon";
	}

	@PostMapping("/InsertAdminCoupon")
	public String processFormData(@ModelAttribute("AdminCouponBean") AdminCouponBean admincouponBean,
			BindingResult result, Model model, HttpServletRequest request) {
		Member ac = (Member) model.getAttribute("LoginOK");
//		AdminCouponBean.setShopBean(ac.getShopBean());
		// img
//		MultipartFile picture = admincouponBean.getAdmincoupon_image();
//		String originalFilename = picture.getOriginalFilename();
//		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
//			admincouponBean.setAdminfile_name(originalFilename);
//		}
//		if (picture != null && !picture.isEmpty()) {
//			try {
//				byte[] b = picture.getBytes();
//				Blob blob = new SerialBlob(b);
//				admincouponBean.setAdmincoupon_pic(blob);
//			} catch (Exception e) {
//				e.printStackTrace();
//				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//			}
//		}

		editcouponService.saveAdminCoupon(admincouponBean);

		return "redirect:/admin/InsertAdminCoupon";
	}

}
