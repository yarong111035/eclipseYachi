package _20_shoppingMall._21_product.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.http.HttpRequest;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import _02_model.entity.ProductBean;
import _02_model.entity.ProductTypeBean;
import _20_shoppingMall._21_product.exception.ProductNotFoundException;
import _20_shoppingMall._21_product.service.ProductService;
 


//POJO類別 不須繼承任何類別
@Controller  //spring mvc 控制器
public class ProductController {
	
	@Autowired
	ProductService service;
	@Autowired
	ServletContext context;
	
	
//	控制器方法
	@RequestMapping("/welcome")
	public String nightShop(Model model) {  //有東西要交給view 就放model
//		model.addAttribute("store", "方家雞肉飯"); // 底層是 forward()
		return "_14_nightShop/1_shop"; 
	}
	
	
	//商品主頁(找出所有產品)
	@RequestMapping({"/shopping.store"})
	public String store(Model model) {
		List<ProductBean> list = service.getAllProducts();
		model.addAttribute("products", list);
		return "_12_shoppingmall/2_shopping";
	}

	
	//更新產品價格
	@RequestMapping("/update/price")
	public String updatePrice(Model model) {
		service.updateAllPrice();
		return "redirect:/shopping.store";  
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
	@RequestMapping("/sort={sortId}")
	public String getProductsBySort(Model model, @PathVariable("sortId") int sortId) {
		List<ProductBean> products = service.getProductBySort(sortId);
		ProductTypeBean ps = service.getSortById(sortId);
		model.addAttribute("products", products);
		model.addAttribute("sort", ps); // 依據產品種類顯示title
		return "_12_shoppingmall/2_shopping";
	}
	
	
	
//	查詢單筆產品資料
	@RequestMapping("/singleProduct")
	public String getProductById(@RequestParam("id") Integer id,Model model) {
		model.addAttribute("product", service.getProductById(id));
		return "_12_shoppingmall/3_productDetail";
	}
	
	
	/**
	 * step1.抵達表單頁面的路徑是：@GetMapping("/products/add") 
	 * step2.此表單預設action為"/products/add"
	 * step3.表單送出使用post方法，故再加上路徑則會走標註@PostMapping("/products/add") 的控制器方法
	 */
	
//	表單頁面控制器方法
	@GetMapping("/products/add")
	public String getAddNewProductFormString(Model model) {
		ProductBean pb = new ProductBean();
//		pb.setProduct_name("商品名稱不知道要取什麼-1");  
//		pb.setProduct_info("因為不知道要賣什麼所以商品資訊也不知道要填什麼");
//		pb.setProduct_price(111.0);
		model.addAttribute("productBean", pb); //將pb 加入model中
		return "_16_admin/insertProduct";
	}
	
	
	/**
	 * action 屬性的預設值，原本頁面的路徑
	 */
	
	
//	新增表單成功
	@PostMapping("/products/add")  // 路徑與上一支方法一樣，但是此處請求方法是Post 所以會來找這一支控制器
	public String processAddNewProductForm(@ModelAttribute("productBean") ProductBean pb, BindingResult result) {
//		新增產品需傳入ProductBean參數(從上model取出)
//		@ModelAttribute用在方法參數內：可直接從參數取值(又稱數據綁定)
//		資料檢查條件寫在這...
		String[] suppressedFields = result.getSuppressedFields();
		if(suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		if(pb.getProduct_stock() == null) {
			pb.setProduct_stock(0);
		}
		
//		圖片上傳
//		step1: 從前端取得使用者上傳圖片的路徑
		MultipartFile productImage = pb.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		pb.setFilename(originalFilename);
		
//		step2: 建立Blob物件，交由 Hibernate寫入資料庫
		if(productImage != null && !productImage.isEmpty()) {
			try {
//				需要先得到byte[]，才能透過SerialBlob(byte[] b) 得到Blob的物件
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				pb.setProduct_pic(blob);
			}catch (Exception e) {
				throw new RuntimeException("檔案上傳時發生異常: " + e.getMessage());
			}
		}
		service.addProduct(pb);  //必須先存到資料庫
		
//		step3: 把檔案上傳到server端
//		取得副檔名，因為不需要使用者上傳的檔名
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//		存在應用系統的更目錄"/"(C:/_JSP/tomcat9/webapps/mvcExercise)
		String rootDirectory = context.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory,"userUploads"); //存在應用系統更目錄下的userUploads資料夾
			if(!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, "Product_" + pb.getProduct_id() + ext); //將檔案變成 File物件，
			productImage.transferTo(file);// 把照片轉到指定位置(需要傳入File物件)
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳時發生異常: " + e.getMessage());
		}
		
		return "redirect:/shopping.store";
	}
	
	
	/**
	 * 當控制器方法傳回此種型別的物件時，分派器會將它的內容依照Http協定的格式，送回給提出請求的前端裝置。
	 * ResponseEntity 類別內含三種資訊
	 * 1. 回應本體
	 * 2. 回應標頭
	 * 3. 狀態碼
	 */
	
//	從資料庫撈Blob型態，讓商品頁出現產品
//	ResponseEntity<Byte[]> => 回應本體的資料型態(blob 需轉成 位元組型態才可讀取)
	@RequestMapping(value = "/getPicture/{product_id}")
	public ResponseEntity<byte[]> getPicture(
			HttpServletResponse resp, 
			@PathVariable Integer product_id){
		String filePath = "/data/images/mediumPic/noImage1.PNG"; //預設圖片路徑
		byte[] pic = null;
		String filename = "";
		int len = 0;
		HttpHeaders headers = new HttpHeaders();
		ProductBean productBean = service.getProductById(product_id); 
		if(productBean != null) {
			Blob blob = productBean.getProduct_pic();
			filename = productBean.getFilename();
			if(blob != null) {
				try {
					len = (int) blob.length();  //取得照片大小
					pic = blob.getBytes(1, len); //???   jdbc相關類別都是1開頭
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			}else { //如果沒有照片
				pic = toByteArray(filePath);
				filename = filePath;
			}
		}else {
			pic = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue()); //請瀏覽器不要快取圖片內容
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType); //把字串轉成 mediaType 型別的物件
		System.out.println("mediatype = " + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responoEntity = new ResponseEntity<>(pic, headers, HttpStatus.OK); 
		return responoEntity;
	}
	
	
	
//	將照片以位元組陣列方式讀入
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int)size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		}catch (FileNotFoundException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	

	
	
	/**
	 * 會先執行加@ModelAttribute註釋的控制器方法
	 * 並將結果添加到model中
	 */
	
//	得到種類id與對應的name
	@ModelAttribute("sortMap") 
	public Map<Integer, String> getSortList() {
		Map<Integer, String> sortMap = new HashMap<>();
		List<ProductTypeBean> list = service.getSortList();
		for(ProductTypeBean ps : list) {  //取出每一個種類物件的(id,name) 放入map物件
			sortMap.put(ps.getProduct_type_id(), ps.getProduct_type_name());
		}
		return sortMap; 
	}
	
	@ModelAttribute("sortList")   
	public List<ProductTypeBean> getSorList() {
	    return service.getSortList();
	}
	
//	說明前端瀏覽器只能傳送的欄位(必須現在前端送來的欄位)
	@InitBinder
	public void whiteListing(WebDataBinder binder) {
		binder.setAllowedFields(
			"product_name",
			"product_price",
			"product_stock",
			"product_info"	,
			"product_spec",
			"product_type_id",
			"productImage"
		);
	}
	
//	使用Model
	@ExceptionHandler({ProductNotFoundException.class})
	public String handleErrorModel
	(Model model, HttpServletRequest request, ProductNotFoundException exception ) {
		model.addAttribute("invalidProductId",  exception.getProduct_id());
		model.addAttribute("exception",  exception);
		model.addAttribute("message", exception.getMessage() + "使用Model 而非 ModelAndView");
		model.addAttribute("url", request.getRequestURL() + "?" + request.getQueryString());
		return "_12_shoppingmall/productNotFound";
	}
	
	
// 未處理的例外都由此方法handle
	@ExceptionHandler({Throwable.class})
	public String handleError2
	(Model model, HttpServletRequest request, Throwable exception ) {
		model.addAttribute("exception",  exception);
		model.addAttribute("message", exception.getMessage() + "(處理大多數例外)");
		model.addAttribute("url", request.getRequestURL() + "?" + request.getQueryString());
		return "_00_util/allUtil/jsp/DisplaySystemException";
	}
	
	
	
//	@RequestMapping("sortList")
//	public List<String> getSortList(){
//		return service.getAllSorts();
//	}
	
	
//	@RequestMapping("/productDetail.html")
//	public String showProductInfo() {
//		return "3_productDetail";
//	}
	
	@RequestMapping("/carContent.html")
	public String showCarContent() {
		return "_12_shoppingmall/5_cartContent";
	}
	
	@RequestMapping("/orderDetail.html")
	public String showOrderDetail() {
		return "_12_shoppingmall/6_orderDetail";
	}
	
	
	
	
}
