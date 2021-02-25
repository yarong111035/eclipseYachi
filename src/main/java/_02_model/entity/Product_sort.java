package _02_model.entity;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //等同於 以下@Getter/@Setter @ToString @EqualsAndHashCode @RequiredArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "product_sort")
public class Product_sort implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer sortId;
	private String sortName;
	
	//mappedBy 表本類別對應的表格並未含有可維護紀錄的外鍵
	//但對照類別(productBean)內的product_sort_id 屬性中有外鍵的相關資訊
	@OneToMany(mappedBy = "sort") 
	private Set<ProductBean> product = new LinkedHashSet<>();

	public Product_sort(Integer sortId, String sortName, Set<ProductBean> product) {
		super();
		this.sortId = sortId;
		this.sortName = sortName;
		this.product = product;
	}



	public Integer getSortId() {
		return sortId;
	}

	public void setSortId(Integer sortId) {
		this.sortId = sortId;
	}

	public String getSortName() {
		return sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

	public Set<ProductBean> getProduct() {
		return product;
	}

	public void setProduct(Set<ProductBean> product) {
		this.product = product;
	}

	
	
	
	
}
