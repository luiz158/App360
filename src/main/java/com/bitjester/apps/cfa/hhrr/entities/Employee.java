package com.bitjester.apps.cfa.hhrr.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import com.bitjester.apps.cfa.entities.Brand;
import com.bitjester.apps.cfa.entities.Country;
import com.bitjester.apps.common.BaseEntity;

@Cacheable
@Entity
@Table(name = "employees", uniqueConstraints = @UniqueConstraint(columnNames = { "hurid", "brand", "country" }))
public class Employee extends BaseEntity {
	private static final long serialVersionUID = 1L;

	private String fname;
	private String lname;
	private String hurid;
	@ManyToOne
	@JoinColumn(name = "brand")
	private Brand brand;
	@ManyToOne
	@JoinColumn(name = "country")
	private Country country;
	private String position;
	@Column(unique = true)
	private String doc_id;
	private Boolean active = Boolean.TRUE;
	@ManyToOne
	@JoinColumn(name = "boss")
	private Employee boss;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "boss", fetch = FetchType.LAZY)
	@OrderBy("lname, fname")
	private List<Employee> subs = new ArrayList<Employee>(0);

	// --- Misc. methods ---//
	@Transient
	public String getFullName() {
		return (fname.trim() + " " + lname.trim()).trim();
	}

	// --- Getters & Setters --- //
	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getHurid() {
		return hurid;
	}

	public void setHurid(String hurid) {
		this.hurid = hurid;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getDoc_id() {
		return doc_id;
	}

	public void setDoc_id(String doc_id) {
		this.doc_id = doc_id;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public Employee getBoss() {
		return boss;
	}

	public void setBoss(Employee boss) {
		this.boss = boss;
	}

	public List<Employee> getSubs() {
		return subs;
	}

	public void setSubs(List<Employee> subs) {
		this.subs = subs;
	}
}
