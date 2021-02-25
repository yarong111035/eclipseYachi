package _02_model.entity;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Shop_Menu")
public class ShopMenuBean implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer menu_id;
	
	@ManyToOne
	@JoinColumn(name = "FK_shop_id")
	private ShopBean shopBean;
	
	private Blob menu_photo;
	
	private String menu_name;
	
	private String menu_detail;
	
	private Double menu_price;

	public Integer getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(Integer menu_id) {
		this.menu_id = menu_id;
	}

	public ShopBean getShopBean() {
		return shopBean;
	}

	public void setShopBean(ShopBean shopBean) {
		this.shopBean = shopBean;
	}

	public Blob getMenu_photo() {
		return menu_photo;
	}

	public void setMenu_photo(Blob menu_photo) {
		this.menu_photo = menu_photo;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getMenu_detail() {
		return menu_detail;
	}

	public void setMenu_detail(String menu_detail) {
		this.menu_detail = menu_detail;
	}

	public Double getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(Double menu_price) {
		this.menu_price = menu_price;
	}
	
	
}
