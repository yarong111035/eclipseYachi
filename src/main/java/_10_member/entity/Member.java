package _10_member.entity;

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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import _02_model.entity.ShopBean;
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
	
	private String username;
	

	private String password;
	
	private String fullname;
	
	@Column(length = 1)
	private String sex;
	
	@Temporal(TemporalType.DATE)

	private Date birthday;
	
	private String phone;
	

	private String email;
	
	private String address;
	private String memberType; 
	
	@Temporal(TemporalType.TIMESTAMP) 
	private Date registerTime;
	
	private Blob image;
	private Clob memo;
	
	@OneToOne
	@JoinColumn(name = "FK_shop_id")
	private ShopBean shopBean;
	
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

	 
	 
	public Member() {
		super();
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

	public Clob getMemo() {
		return memo;
	}

	public void setMemo(Clob memo) {
		this.memo = memo;
	}

	public ShopBean getShopBean() {
		return shopBean;
	}

	public void setShopBean(ShopBean shopBean) {
		this.shopBean = shopBean;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}


	 
	 
	 
}