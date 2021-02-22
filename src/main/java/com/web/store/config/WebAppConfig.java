package com.web.store.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

//原本繼承的 WebMvcConfigurerAdapter類別已作廢，改實作 WebMvcConfigurer介面
/*
Step1(@Configuration): 告訴Spring框架此類別含有bean的組態資訊
Step2(@EnableWebMvc):  啟用Spring MVC，將請求分派給以 @Controller 修飾的POJO類別
Step3(@ComponentScan): 請Spring掃描有定義註釋的套件(含有Annotation
	(@Controller,@Repository,@Service,@Component)來說明Bean的組態資訊)
	({"com.web.store.controller","com.web.store.service.impl","com.web.store.dao.impl"})
	也需要掃描 RootAppConfig.java
*/

@Configuration
@EnableWebMvc
@ComponentScan("com.web.store")
public class WebAppConfig implements WebMvcConfigurer {
	
	@Bean
	//通知Sping 框架到哪尋找jsp網頁
	public ViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
//		resolver.setViewClass(JstlView.class); //新版spring框架不需此行
		resolver.setPrefix("/WEB-INF/views/");  
		resolver.setSuffix(".jsp");				  
		return resolver;
	}
	
	//前導字 + 後導字 = /WEB-INF/views/welcome.jsp
	//resolver.setPrefix("/WEB-INF/views/");  views 後面一定要有斜線
	
	
	
	/* 使用SpringMVC 框架時，靜態資源會被攔截(因為所有請求都交由分派器處理了)，需要新增額外配置。
		訪問靜態資源，需實作 addResourceHandlers(ResourceHandlerRegistry registry)
		只要是 /css/開頭的任何請求，都轉到/css/去尋找 
	*/
		@Override
		public void addResourceHandlers(ResourceHandlerRegistry registry) {
			registry.addResourceHandler("/css/**")
					.addResourceLocations("/WEB-INF/views/css/");
			registry.addResourceHandler("/images/**")
					.addResourceLocations("/WEB-INF/views/images/");
			registry.addResourceHandler("/images_2/**")
					.addResourceLocations("/WEB-INF/views/images_2/");
			registry.addResourceHandler("/js/**")
					.addResourceLocations("/WEB-INF/views/js/");
//			registry.addResourceHandler("/header/**")
//					.addResourceLocations("WEB-INF/views/header/");
		}
	
}
