package com.web.store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.store.model.BookBean;
import com.web.store.model.CompanyBean;
import com.web.store.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	ProductService service;  //透過webAppConfig 組態設定掃描的套件autowired
	
//	@RequestMapping("/products")
//	public String list(Model model) {
//		List<BookBean> list = service.getAllProducts();
//		model.addAttribute("products", list);
//		return "products";  //回傳真正的jsp名稱
//	}
//	
//	@RequestMapping("/update/stock")
//	public String updateStock(Model model) {
//		service.updateAllStocks();
//		return "redirect:/products";  // 更新資料 => sendRedirect()， :/ 之間不可空白
//	}
//	
//	@RequestMapping("/queryByCategory")
//	public String getCategoryList(Model model) {
//		List<String> list = service.getAllCategories();
//		model.addAttribute("categoryList", list);
//		return "types/category";
//	}
//	
//	//參數category 會變動 
//	@RequestMapping("/products/{category}")
//	public String getProductsByCategory(@PathVariable("category") String category, Model model) {
//		List<BookBean> products = service.getProductByCategory(category);
//		model.addAttribute("products", products);
//		return "products"; 
//	}
//	
//	
//	@RequestMapping("/product")  //@RequestParam會取出查詢字串id=?，可查詢某id的產品
//	public String gitProductsById(@RequestParam("id")Integer id, Model model) {
//		model.addAttribute("product", service.getProductById(id));
//		return "product";
//	}
//	
//	
//	
//	
//	
//	
//	
////	@RequestMapping(value = "/products/add")  
//	//等同於 => 
//	@GetMapping("/products/add") // 客戶端使用get方法提出請求，會走這個方法
//	public String getAddNewProductForm(Model model) {
//		BookBean bb = new BookBean();
//		bb.setTitle("aaa");  
//		model.addAttribute("bookBean", bb);
//		return "addProduct";
//	}
//	
////  form 表單送出的預設路徑是
////	@RequestMapping(value = "/products/add", method = RequestMethod.POST) 
////  等同於 => 
//	@PostMapping("/products/add")  // 客戶端 使用post方法提出請求，會走這個方法
//	public String processAddNewProductForm(@ModelAttribute("bookBean") BookBean bb) {//表單物件(會把表單資料存在bookBean)
////		資料檢查條件...
//		service.addProduct(bb);
//		return "redirect:/products";
//	}
	
	
//  如果資源再但提出的請求方法不確的話，會丟出 405 (method not allow)
	
//	@RequestMapping(value = "/products/add", method = RequestMethod.GET)
//	等同於 => @GetMapping("/products/add")
	
//	@RequestMapping(value = "/products/add", method = RequestMethod.POST)
//	等同於 => @PostMapping("/products/add")
	
//	@RequestMapping(value = "/products/add", method = RequestMethod.PUT)
//	等同於 => @PutMapping("/products/add")
	
//	@RequestMapping(value = "/products/add", method = RequestMethod.DELETE)
//	等同於 => @DeleteMapping("/products/add")
	
	
//	只要在控制器類別內，只要加@ModelAttribute，一定會先把有加此注釋run一次
//	@ModelAttribute("companyList")     //送空白表單
//	public Map<Integer, String> getCompanyList() {
//	    Map<Integer, String> companyMap = new HashMap<>();
//	    List<CompanyBean> list = service.getCompanyList();
//	    for (CompanyBean cb : list) {
//	        companyMap.put(cb.getId(), cb.getName()); //前端會送 option 的 value(cb.getId())的值回來
//	    }
//	    return companyMap;  
//	    //傳回值會自動放到model裡面，成為model的屬性物件 
//	    //@ModelAttribute("companyList")  ===>  Model.addAttribute("companyList", companyMap)
//	    
//	}
//
//	@ModelAttribute("categoryList")   
//	public List<String> getCategoryList() {
//	    return service.getAllCategories();
//	}
	
	
	
	
	
	
	
	
	
	
	
//	@RequestMapping("/products")
//	public String list(Model model) {
//		CompanyBean cb = new CompanyBean(1, "學貫行銷股份有限公司", 
//				"台北市林森南路四號六樓", "http://www.xbook.com.tw/");
//
//		BookBean bb = new BookBean(1002, "PHP&MySQL程式設計實例講座", "陳惠貞", 
//				580.0, 0.6, "bookxb002.jpg", "P832", null, 25,	"Web", cb);
//		model.addAttribute("product", bb);
//		return "products"; 
//	}
	

}
