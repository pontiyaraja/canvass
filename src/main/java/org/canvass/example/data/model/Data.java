package org.canvass.example.data.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.core.style.ToStringCreator;

@Entity
@Table(name="DATAS")
public class Data {
    @Id
    @GeneratedValue
	private Integer dataId;
	
    @Column(unique = true)
	@NotNull
	private String email;
    @Column
    private String userName;
    @Column
    @NotNull
    private double phone;

	public Integer getDataId() {
		return dataId;
	}



	public void setDataId(Integer dataId) {
		this.dataId = dataId;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public double getPhone() {
		return phone;
	}



	public void setPhone(double phone) {
		this.phone = phone;
	}



	public String toString() {
		return new ToStringCreator(this).append("dataId", dataId).append("email", email).append("userName", userName).append("phone", phone)
				.toString();
	}
}
