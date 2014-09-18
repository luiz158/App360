package com.bitjester.apps.cfa.surveys.entities;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.bitjester.apps.common.BaseEntity;

@Cacheable
@Entity
@Table(name = "questions")
public class Question extends BaseEntity {
	private static final long serialVersionUID = 1L;

	@ManyToOne
	@JoinColumn(name = "survey")
	private Survey survey;
	@ManyToOne
	@JoinColumn(name = "behavior")
	private Behavior behavior;
	private Integer qindex;
	private Integer scale;
	private Integer weight;
	private Boolean open;
	private Boolean required;
	private String qtext;

	// --- Methods ---//
	// --- Getters & Setters --- //
	public Survey getSurvey() {
		return survey;
	}

	public void setSurvey(Survey survey) {
		this.survey = survey;
	}

	public Behavior getBehavior() {
		return behavior;
	}

	public void setBehavior(Behavior behavior) {
		this.behavior = behavior;
	}

	public Integer getQindex() {
		return qindex;
	}

	public void setQindex(Integer qindex) {
		this.qindex = qindex;
	}

	public Integer getScale() {
		return scale;
	}

	public void setScale(Integer scale) {
		this.scale = scale;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public Boolean getOpen() {
		return open;
	}

	public void setOpen(Boolean open) {
		this.open = open;
	}

	public Boolean getRequired() {
		return required;
	}

	public void setRequired(Boolean required) {
		this.required = required;
	}

	public String getQtext() {
		return qtext;
	}

	public void setQtext(String qtext) {
		this.qtext = qtext;
	}
}
