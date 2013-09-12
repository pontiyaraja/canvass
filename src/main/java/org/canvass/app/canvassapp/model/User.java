package org.canvass.app.canvassapp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.core.style.ToStringCreator;

@Entity
@Table(name="ORDERS")
public class User {
    @Id
    @GeneratedValue
	private Integer userId;
	
    @NotNull	
	private String name;
    @Column(unique = true)
    @NotNull
    private String email;
    @Column
    @NotNull
    private String phone;

	public Integer getUserId() {
		return userId;
	}

	void setUserId(Integer userId) {
		this.userId = userId;
	}	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String toString() {
		return new ToStringCreator(this).append("userId", userId).append("name", name).append("email", email).append("phone", phone)
				.toString();
	}
}
