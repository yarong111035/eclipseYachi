package _02_model.entity;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "AdminCoupon_Type")
public class AdminCouponTypeBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer admincoupon_type_id;
	
	private String admincoupon_type_name;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "adminCouponTypeBean")
	private Set<AdminCouponBean>  admincoupons = new LinkedHashSet<>();
	
	public AdminCouponTypeBean() {
		super();
	}

	public AdminCouponTypeBean(Integer admincoupon_type_id, String admincoupon_type_name,
			Set<AdminCouponBean> admincoupons) {
		super();
		this.admincoupon_type_id = admincoupon_type_id;
		this.admincoupon_type_name = admincoupon_type_name;
		this.admincoupons = admincoupons;
	}

	public Integer getAdmincoupon_type_id() {
		return admincoupon_type_id;
	}

	public void setAdmincoupon_type_id(Integer admincoupon_type_id) {
		this.admincoupon_type_id = admincoupon_type_id;
	}

	public String getAdmincoupon_type_name() {
		return admincoupon_type_name;
	}

	public void setAdmincoupon_type_name(String admincoupon_type_name) {
		this.admincoupon_type_name = admincoupon_type_name;
	}

	public Set<AdminCouponBean> getAdmincoupons() {
		return admincoupons;
	}

	public void setAdmincoupons(Set<AdminCouponBean> admincoupons) {
		this.admincoupons = admincoupons;
	}
	
	
	

}