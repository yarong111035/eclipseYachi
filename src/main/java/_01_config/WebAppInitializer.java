package _01_config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;


public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {RootAppConfig.class};
	}

	// 傳回提供組態資訊的 Java 類別
	@Override
	protected Class<?>[] getServletConfigClasses() { 
		return new Class[] {WebAppConfig.class};
		//告訴Spring MVC 哪些套件下有控制器類別，(WebAppConfig會去掃描)
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};  // "/" 表示分派器要處理的所有請求都要交由分派器處理
	}
	
	// 配置POST 轉為 DELETE 或 PUT 請求的設定
	@Override
	protected Filter[] getServletFilters() {
		HiddenHttpMethodFilter hhmf = new HiddenHttpMethodFilter();
		CharacterEncodingFilter  cef = new CharacterEncodingFilter();
		cef.setEncoding("UTF-8");
		return new Filter[] {cef, hhmf};
		
//		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
//		characterEncodingFilter.setEncoding("UTF-8");
//		return new Filter[] {characterEncodingFilter, new HiddenHttpMethodFilter()};
	}
	
//	@Override
//	protected Filter[] getServletFilters() {
//		CharacterEncodingFilter cef = new CharacterEncodingFilter();
//		cef.setEncoding("UTF-8");
//		return new Filter[] {cef};
//	}
	
}
