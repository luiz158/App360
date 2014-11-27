package com.bitjester.apps.app360.surveys.entities;

import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.bitjester.apps.common.BaseEntity;

@Cacheable
@Entity
@Table(name = "behaviors")
public class Behavior extends BaseEntity {
	private static final long serialVersionUID = 1L;

	@Column(name = "name")
	private String name;
	@Column(name = "description")
	private String description;
	@ManyToOne
	@JoinColumn(name = "competence")
	private Competence competence;

	// --- Methods ---//
	// --- Getters & Setters --- //
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Competence getCompetence() {
		return competence;
	}

	public void setCompetence(Competence competence) {
		this.competence = competence;
	}
}
