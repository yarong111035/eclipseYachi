package _02_model.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Coupon")
public class CouponBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer coupon_id;
	
	
	
	private Integer coupon_amount;
	
	private String coupon_info;
	
	private String coupon_rule;
	
	private Integer coupon_days;
	
	private Date coupon_birth;
	
	private String coupon_name;
	
	private String coupon_memo;
	
	@ManyToOne
	@JoinColumn(name = "FK_shop_id")
	private ShopBean shopBean;

	
	
	@ManyToOne
	@JoinColumn(name = "FK_shop_type_id")
	private ShopTypeBean shopTypeBean;
	
	@ManyToMany(cascade = CascadeType.ALL, mappedBy = "coupons")
	private Set<FavoriteCouponListBean> couponlist = new LinkedHashSet<FavoriteCouponListBean>();
	
	
	public Integer getCoupon_id() {
		return coupon_id;
	}
	
	

	public void setCoupon_id(Integer coupon_id) {
		this.coupon_id = coupon_id;
	}

	

	public Integer getCoupon_amount() {
		return coupon_amount;
	}

	public void setCoupon_amount(Integer coupon_amount) {
		this.coupon_amount = coupon_amount;
	}

	public String getCoupon_info() {
		return coupon_info;
	}

	public void setCoupon_info(String coupon_info) {
		this.coupon_info = coupon_info;
	}

	public String getCoupon_rule() {
		return coupon_rule;
	}

	public void setCoupon_rule(String coupon_rule) {
		this.coupon_rule = coupon_rule;
	}

	public Integer getCoupon_days() {
		return coupon_days;
	}

	public void setCoupon_days(Integer coupon_days) {
		this.coupon_days = coupon_days;
	}

	public Date getCoupon_birth() {
		return coupon_birth;
	}

	public void setCoupon_birth(Date coupon_birth) {
		this.coupon_birth = coupon_birth;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public String getCoupon_memo() {
		return coupon_memo;
	}

	public void setCoupon_memo(String coupon_memo) {
		this.coupon_memo = coupon_memo;
	}
	
	

	public ShopBean getShopBean() {
		return shopBean;
	}



	public void setShopBean(ShopBean shopBean) {
		this.shopBean = shopBean;
	}

	
	

	
	

	public Set<FavoriteCouponListBean> getCouponlist() {
		return couponlist;
	}



	public void setCouponlist(Set<FavoriteCouponListBean> couponlist) {
		this.couponlist = couponlist;
	}



	public CouponBean(Integer coupon_id, Integer coupon_amount, String coupon_info,
			String coupon_rule, Integer coupon_days, Date coupon_birth, String coupon_name, String coupon_memo,
			ShopBean shopBean) {
		super();
		this.coupon_id = coupon_id;
		
		this.coupon_amount = coupon_amount;
		this.coupon_info = coupon_info;
		this.coupon_rule = coupon_rule;
		this.coupon_days = coupon_days;
		this.coupon_birth = coupon_birth;
		this.coupon_name = coupon_name;
		this.coupon_memo = coupon_memo;
		this.shopBean = shopBean;
	}



	public CouponBean() {
		super();
	}



	



	



	public ShopTypeBean getShopTypeBean() {
		return shopTypeBean;
	}



	public void setShopTypeBean(ShopTypeBean shopTypeBean) {
		this.shopTypeBean = shopTypeBean;
	}
	
	
	
	
	
}
