package _02_model.entity;

import java.io.Serializable;
import java.sql.Blob;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Shop")
public class ShopBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer shop_id;
	
	@OneToOne(mappedBy = "shopBean")
	private MemberBean memberBean;
	
	private String shop_name;
	
	private Blob shop_media;
	
	private String shop_info;
	
	private String shop_addr;
	
	private String shop_phone;
	
	private String shop_hours;
	
	private String shop_hyperlink;
	
	@OneToOne
	@JoinColumn(name = "FK_coupon_list_id")
	private CouponListBean couponListBean;
	
	private Double shop_score;
	
	private Integer market_id;
	
	private String shop_memo;
	
	@ManyToOne
	@JoinColumn(name = "FK_shop_type_id")
	private ShopTypeBean shopTypeBean;
	
	@ManyToOne
	@JoinColumn(name = "FK_nightmarket_id")
	private NightMarketBean nightMarketBean;
	
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "shopBean")
	private Set<ShopMenuBean> shopMenus = new LinkedHashSet<ShopMenuBean>();
	
	
	
	

	public CouponListBean getCouponListBean() {
		return couponListBean;
	}

	public void setCouponListBean(CouponListBean couponListBean) {
		this.couponListBean = couponListBean;
	}

	public Set<ShopMenuBean> getShopMenus() {
		return shopMenus;
	}

	public void setShopMenus(Set<ShopMenuBean> shopMenus) {
		this.shopMenus = shopMenus;
	}

	public NightMarketBean getNightMarketBean() {
		return nightMarketBean;
	}

	public void setNightMarketBean(NightMarketBean nightMarketBean) {
		this.nightMarketBean = nightMarketBean;
	}

	public ShopTypeBean getShopTypeBean() {
		return shopTypeBean;
	}

	public void setShopTypeBean(ShopTypeBean shopTypeBean) {
		this.shopTypeBean = shopTypeBean;
	}

	

	public Integer getShop_id() {
		return shop_id;
	}

	public void setShop_id(Integer shop_id) {
		this.shop_id = shop_id;
	}

	

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public Blob getShop_media() {
		return shop_media;
	}

	public void setShop_media(Blob shop_media) {
		this.shop_media = shop_media;
	}

	public String getShop_info() {
		return shop_info;
	}

	public void setShop_info(String shop_info) {
		this.shop_info = shop_info;
	}

	public String getShop_addr() {
		return shop_addr;
	}

	public void setShop_addr(String shop_addr) {
		this.shop_addr = shop_addr;
	}

	public String getShop_phone() {
		return shop_phone;
	}

	public void setShop_phone(String shop_phone) {
		this.shop_phone = shop_phone;
	}

	public String getShop_hours() {
		return shop_hours;
	}

	public void setShop_hours(String shop_hours) {
		this.shop_hours = shop_hours;
	}

	

	public String getShop_hyperlink() {
		return shop_hyperlink;
	}

	public void setShop_hyperlink(String shop_hyperlink) {
		this.shop_hyperlink = shop_hyperlink;
	}

	

	public Double getShop_score() {
		return shop_score;
	}

	public void setShop_score(Double shop_score) {
		this.shop_score = shop_score;
	}

	public Integer getMarket_id() {
		return market_id;
	}

	public void setMarket_id(Integer market_id) {
		this.market_id = market_id;
	}

	public String getShop_memo() {
		return shop_memo;
	}

	public void setShop_memo(String shop_memo) {
		this.shop_memo = shop_memo;
	}
	
	

}
