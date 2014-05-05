package com.bitjester.apps.cfa.entities;

import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.bitjester.apps.common.BaseEntity;

@Cacheable
@Entity
@Table(name = "brands")
public class Brand extends BaseEntity {
	private static final long serialVersionUID = 1L;
	
	@Column(name = "name")
	private String name;
	@Column(name = "logo")
	private String logo;
	
	// --- Methods ---//
	// --- Getters & Setters --- //
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

}
