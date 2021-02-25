package _02_model.entity;

import java.io.Serializable;
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
@Table(name = "Cart")
public class CartBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cart_id;
	
	
	@OneToMany(cascade=CascadeType.ALL, mappedBy = "cartBean")
	private Set<CartItemBean> itemBeans = new LinkedHashSet<CartItemBean>();
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="FK_member_id")
	private MemberBean memberBean;
	
	private Integer cart_status;  //用數字表示購物車存在狀況

	public Integer getCart_id() {
		return cart_id;
	}

	public void setCart_id(Integer cart_id) {
		this.cart_id = cart_id;
	}

	

	public Set<CartItemBean> getItemBeans() {
		return itemBeans;
	}

	public void setItemBeans(Set<CartItemBean> itemBeans) {
		this.itemBeans = itemBeans;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public Integer getCart_status() {
		return cart_status;
	}

	public void setCart_status(Integer cart_status) {
		this.cart_status = cart_status;
	}

	public CartBean(Integer cart_id, Set<CartItemBean> itemBeans, MemberBean memberBean,
			Integer cart_status) {
		super();
		this.cart_id = cart_id;
		this.itemBeans = itemBeans;
		this.memberBean = memberBean;
		this.cart_status = cart_status;
	}

	public CartBean() {
		super();
	}
	
	
}
