package com.web.store.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data //等同於 以下@Getter/@Setter @ToString @EqualsAndHashCode @RequiredArgsConstructor
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "product")
public class ProductBean implements Serializable {
	private static long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer product_id;
	private String product_no;
	private String product_name;
	private Integer product_price;
	private Integer product_stock;
	private String product_info;
	private Blob product_pic;
	private Date product_expire;
	private String filename;
	private String product_memo;
	private String product_spec;
	@Transient  //忽略Entity屬性映射至資料表
	private Integer sortId;
	
	//未放入產品評價
	
	@ManyToOne
	@JoinColumn(name = "fk_sort_id")
	private Product_sort sort; // fk 商品種類

	public ProductBean(Integer product_id, String product_no, String product_name, Integer product_price,
			Integer product_stock, String product_info, Blob product_pic, Date product_expire, String filename,
			String product_memo, String product_spec, Integer sortId, Product_sort sort) {
		super();
		this.product_id = product_id;
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_stock = product_stock;
		this.product_info = product_info;
		this.product_pic = product_pic;
		this.product_expire = product_expire;
		this.filename = filename;
		this.product_memo = product_memo;
		this.product_spec = product_spec;
		this.sortId = sortId;
		this.sort = sort;
	}

	public ProductBean() {
		super();
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public static void setSerialversionuid(long serialversionuid) {
		serialVersionUID = serialversionuid;
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public String getProduct_no() {
		return product_no;
	}

	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public Integer getProduct_price() {
		return product_price;
	}

	public void setProduct_price(Integer product_price) {
		this.product_price = product_price;
	}

	public Integer getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(Integer product_stock) {
		this.product_stock = product_stock;
	}

	public String getProduct_info() {
		return product_info;
	}

	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}

	public Blob getProduct_pic() {
		return product_pic;
	}

	public void setProduct_pic(Blob product_pic) {
		this.product_pic = product_pic;
	}

	public Date getProduct_expire() {
		return product_expire;
	}

	public void setProduct_expire(Date product_expire) {
		this.product_expire = product_expire;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getProduct_memo() {
		return product_memo;
	}

	public void setProduct_memo(String product_memo) {
		this.product_memo = product_memo;
	}

	public String getProduct_spec() {
		return product_spec;
	}

	public void setProduct_spec(String product_spec) {
		this.product_spec = product_spec;
	}

	public Integer getSortId() {
		return sortId;
	}

	public void setSortId(Integer sortId) {
		this.sortId = sortId;
	}

	public Product_sort getSort() {
		return sort;
	}

	public void setSort(Product_sort sort) {
		this.sort = sort;
	}
	
	
	
}
