package com.bitjester.apps.app360.entities;

import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.bitjester.apps.common.BaseEntity;

@Cacheable
@Entity
@Table(name = "countries")
public class Country extends BaseEntity {
	private static final long serialVersionUID = 1L;

	@Column(name = "name")
	private String name;

	// --- Methods ---//
	// --- Getters & Setters --- //
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}