package _02_model.entity;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
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
import javax.persistence.Table;

import _10_member.entity.Member;


@Entity
@Table(name = "Orders")
public class OrderBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer order_id;
	
	@ManyToOne
	@JoinColumn(name="FK_member_id")
	private Member memberBean;  //fk member 多對一
	
	private String order_address;
	
	@OneToMany(cascade=CascadeType.ALL, mappedBy = "orderBean")
	private Set<OrderItemBean> items = new LinkedHashSet<>();
	
	private String company_id;  //統編號碼
	
	private String company_title;  //統編title
	
	private String invoice_num;  //發票號碼
	
	private Timestamp order_datetime;
	
	private Date shipping_date;
	
	private Integer pay_me;  //用數字分辨付款方式
	
	private Integer order_status_id;  //用數字分辨運送方式
	
	private String order_memo;

	public Integer getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}

	public Member getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(Member memberBean) {
		this.memberBean = memberBean;
	}

	

	public String getOrder_address() {
		return order_address;
	}

	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}

	public Set<OrderItemBean> getItems() {
		return items;
	}

	public void setItems(Set<OrderItemBean> items) {
		this.items = items;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public String getCompany_title() {
		return company_title;
	}

	public void setCompany_title(String company_title) {
		this.company_title = company_title;
	}

	public String getInvoice_num() {
		return invoice_num;
	}

	public void setInvoice_num(String invoice_num) {
		this.invoice_num = invoice_num;
	}

	public Timestamp getOrder_datetime() {
		return order_datetime;
	}

	public void setOrder_datetime(Timestamp order_datetime) {
		this.order_datetime = order_datetime;
	}

	public Date getShipping_date() {
		return shipping_date;
	}

	public void setShipping_date(Date shipping_date) {
		this.shipping_date = shipping_date;
	}

	public Integer getPay_me() {
		return pay_me;
	}

	public void setPay_me(Integer pay_me) {
		this.pay_me = pay_me;
	}

	public Integer getOrder_status_id() {
		return order_status_id;
	}

	public void setOrder_status_id(Integer order_status_id) {
		this.order_status_id = order_status_id;
	}

	public String getOrder_memo() {
		return order_memo;
	}

	public void setOrder_memo(String order_memo) {
		this.order_memo = order_memo;
	}

	public OrderBean(Integer order_id, Member memberBean, String order_address, Set<OrderItemBean> items,
			String company_id, String company_title, String invoice_num, Timestamp order_datetime, Date shipping_date,
			Integer pay_me, Integer order_status_id, String order_memo) {
		super();
		this.order_id = order_id;
		this.memberBean = memberBean;
		this.order_address = order_address;
		this.items = items;
		this.company_id = company_id;
		this.company_title = company_title;
		this.invoice_num = invoice_num;
		this.order_datetime = order_datetime;
		this.shipping_date = shipping_date;
		this.pay_me = pay_me;
		this.order_status_id = order_status_id;
		this.order_memo = order_memo;
	}

	public OrderBean() {
		super();
	}
	
	
}