package com.bitjester.apps.cfa.surveys.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import com.bitjester.apps.common.BaseEntity;

@Cacheable
@Entity
@Table(name = "competencies")
public class Competence extends BaseEntity {
	private static final long serialVersionUID = 1L;

	private String name;
	private String description;
	private String css;
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "competence", orphanRemoval = true)
	@OrderBy("name")
	private List<Behavior> behaviors = new ArrayList<Behavior>(0);

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

	public String getCss() {
		return css;
	}

	public void setCss(String css) {
		this.css = css;
	}

	public List<Behavior> getBehaviors() {
		return behaviors;
	}

	public void setBehaviors(List<Behavior> behaviors) {
		this.behaviors = behaviors;
	}

}
