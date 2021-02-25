package _02_model.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Favorite_ShopList")
public class FavoriteShopListBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer shop_list_id;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="FK_member_id")
	private MemberBean memberBean;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_shop_id")
	private Set<ShopBean> shoplist = new LinkedHashSet<ShopBean>();
	
	private Timestamp subscribe_time;

	public Integer getShop_list_id() {
		return shop_list_id;
	}

	public void setShop_list_id(Integer shop_list_id) {
		this.shop_list_id = shop_list_id;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public Set<ShopBean> getShoplist() {
		return shoplist;
	}

	public void setShoplist(Set<ShopBean> shoplist) {
		this.shoplist = shoplist;
	}

	public Timestamp getSubscribe_time() {
		return subscribe_time;
	}

	public void setSubscribe_time(Timestamp subscribe_time) {
		this.subscribe_time = subscribe_time;
	}
	
	
}
