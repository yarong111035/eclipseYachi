package _20_shoppingMall._21_product.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.http.HttpRequest;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.BeanNotOfRequiredTypeException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import _02_model.entity.CartBean;
import _02_model.entity.ProductBean;
import _02_model.entity.ProductTypeBean;
import _10_member.entity.Member;
import _20_shoppingMall._21_product.exception.ProductNotFoundException;
import _20_shoppingMall._21_product.service.ProductService;
import _20_shoppingMall._21_product.service.ProductTypeService;
import _20_shoppingMall._22_shoppingCart.service.CartBeanService;
import _20_shoppingMall._23_orderProcess.service.OrderItemService;
 

//此controller 目的為 列出商城的產品與產品種類並可以連結至商品明細頁
//POJO類別 不須繼承任何類別
@Controller  //spring mvc 控制器
@SessionAttributes({"pageNo", "LoginOK","sortId"})
public class ProductController {
	@Autowired
	ProductTypeService productTypeService;
	@Autowired
	ProductService productService;
	@Autowired
	ServletContext context;
	@Autowired 
	CartBeanService cartBeanService;
	@Autowired 
	OrderItemService orderItemService;
	
	//撈出資料庫所有產品(轉成json格式)
	@RequestMapping({"/allProducts"})
	public @ResponseBody List<ProductBean> queryAllProducts(Model model) {
		List<ProductBean> products = productService.getAllProducts();
		return products;
	}

	
	//更新產品價格(一次更新所有價格 + 50元)
	@RequestMapping("/update/price")
	public String updatePrice(Model model) {
		productService.updateAllPrice();
		//更新購物車的total(當產品價格改變須同步更新購物車表格的total)
		cartBeanService.updateCartTotal();
		return "redirect:/DisplayPageProducts";  
		//此處的導向是要寫控制器名稱(RequestMapping的名稱)
		//而不是 真正的視圖名稱
	} 
	
	//依分類查詢
//	@RequestMapping("queryBySort")
//	public String getSortList(Model model) {
//		List<Product_sort> list = service.getAllSorts();
//		model.addAttribute("sortList", list);
//		return "2_shopping";
//	}
	

	
	//依種類顯示(請求路徑會變動)
	@RequestMapping("/sortId={sortId}")
	public String getProductsBySort(Model model, @PathVariable(value = "sortId") int sortId) {
		System.out.println("==========分類控制器==========");
		List<ProductBean> products = productService.getProductBySort(sortId);
		ProductTypeBean ps = productTypeService.getTypeById(sortId);
		model.addAttribute("products_DPP", products);
		model.addAttribute("sort", ps); // 依據產品種類顯示title
		model.addAttribute("sortId", ps.getProduct_type_id()); // 依據產品種類顯示title
		return "_12_shoppingmall/2_shopping";
	}
	
	
	
//	查詢單筆產品資料
	@RequestMapping("/singleProduct")
	public String getProductById(
			@RequestParam("id") Integer id,
			Model model) {
		model.addAttribute("product", productService.getProductById(id));
		Integer soldQty = orderItemService.getSoldQty(id); //取得某一個產品售出的總數量
		model.addAttribute("soldQty", soldQty);
		
		return "_12_shoppingmall/3_productDetail";
	}
	
//	server一啟動就會撈出資料庫所有商品種類(目的列出商城主頁旁的分類目錄)
	@ModelAttribute("sortList")   
	public List<ProductTypeBean> getSorList() {
	    return productTypeService.getSortList();
	}
	
	
//	分頁的控制器方法
//	 讀取查詢字串，可能沒有帶查詢字串(required = false)
	@GetMapping("/DisplayPageProducts")
	public String getPageProduct(
			Model model,
			HttpServletRequest req,
			HttpServletResponse res,
			@RequestParam(value = "pageNo", required = false) Integer pageNo)
	{
		System.out.println("==========分頁控制器==========");
		Member memberBean = (Member) model.getAttribute("LoginOK");
		if(pageNo == null) {
			pageNo = 1;
		}
		model.addAttribute("bean", productService);
		Map<Integer, ProductBean> productMap = productService.getPageProducts(pageNo);
		model.addAttribute("pageNo", String.valueOf(pageNo));
		model.addAttribute("totalPages", productService.getTotalPages());
		System.out.println(productMap.values());
		List<ProductBean> produtctList = new LinkedList<>(productMap.values());
		model.addAttribute("products_DPP", produtctList); //將Map 型態轉成 list 放到 Model
		return "_12_shoppingmall/2_shopping";	
	}
	
//	@RequestMapping("sortList")
//	public List<String> getSortList(){
//		return service.getAllSorts();
//	}
	
	
//	@RequestMapping("/productDetail.html")
//	public String showProductInfo() {
//		return "3_productDetail";
//	}
	
	

	
	
	
	
}
