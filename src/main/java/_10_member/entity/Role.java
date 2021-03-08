package _10_member.entity;

import java.sql.Blob;
import java.sql.Clob;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table
public class Role {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String role_code;
	
	private String role_name;
	
	
	@ManyToMany(mappedBy = "roles")
	private Set<Member> member;


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getRole_code() {
		return role_code;
	}


	public void setRole_code(String role_code) {
		this.role_code = role_code;
	}


	public String getRole_name() {
		return role_name;
	}


	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}


	public Set<Member> getMember() {
		return member;
	}


	public void setMember(Set<Member> member) {
		this.member = member;
	}


	public Role() {
		super();
	}
	
	
	
	
}






