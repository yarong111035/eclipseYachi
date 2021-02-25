package com.example.demo.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.example.demo.entity.Member;
import com.example.demo.service.MemberDetailService;

@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{

	
		
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http
			.formLogin()
				.loginPage("/login-view") 
				.loginProcessingUrl("/doLogin")
				.defaultSuccessUrl("/success")
				.and()
			.authorizeRequests()
				.antMatchers("/member/**").hasAnyAuthority("USER")
				.antMatchers("/admin/**").hasAnyAuthority("ADMIN")
				.anyRequest().permitAll()
				.and()
				.csrf().disable();
	}
	

	@Bean
	public PasswordEncoder passwordEncoder() {
		// 使用BCrypt加密
		return new BCryptPasswordEncoder();
	}
	
	@Override 
	public void configure(WebSecurity web) throws Exception{
		// 不攔截靜態資源
		web.ignoring().antMatchers("/static/**");
	}
	
	
}
