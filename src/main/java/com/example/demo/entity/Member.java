package com.example.demo.entity;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Clob;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.*;


import com.sun.istack.NotNull;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table
public class Member implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memberId;
	
	
	@NotBlank(message = "帳號不能為空")
	private String username;
	
	// 不允許特殊符號、數字、英文字母以外的字元輸入
	// 密碼長度4到10個字元
	// 至少要有一個特殊符號
	// 至少要有一個大寫或小寫的英文字母
	// 至少要有一個0-9的數字
	@Pattern(regexp = "^(?!.*[^\\x21-\\x7e])(?=.{4,10})(?=.*[\\W])(?=.*[a-zA-Z])(?=.*\\d).*$" 
	,message = "大小寫英文加數字長度最低為4且要有特殊符號")
	private String password;
	
	@NotBlank(message = "你沒有名子?")
	private String fullname;
	
	@Column(length = 1)
	private String sex;
	
	@Temporal(TemporalType.DATE)
	@Past(message = "你來自未來?") @NotNull 
	private Date birthday;
	
	@NotNull
	@Pattern(regexp = "^09(?=\\d{8}).{8}$",message = "必須是09XX-XXX-XXX")
	private String phone;
	
	@Email
	@Pattern(regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$",
	message = "請輸入正確格式的信箱")
	private String email;
	
	private String address;
	private String memberType; 
	
	@Temporal(TemporalType.TIMESTAMP) 
	private Date registerTime;
	
	private Blob image;
	private Clob memo;
	
	// ‎Member 表存儲認證，Role 儲存權限（許可權）。 
	// 使用者和角色之間是多對多關係，因為使用者可以有一個或多個角色，角色也可以分配給一個或多個使用者。 
	// 所以需要中間表 member_role 來實現多對多關聯。‎

	 @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	    @JoinTable(                              				   //配置中介表的訊息
	        name = "Member_Role",								
	        joinColumns = @JoinColumn(name = "fk_member_id"),        //建立當前表在中介表的外鍵
	        inverseJoinColumns = @JoinColumn(name = "fk_roles_id")
	        )
	private Set<Role> roles;


}
