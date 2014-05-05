package com.bitjester.apps.cfa.surveys.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderColumn;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.bitjester.apps.cfa.hhrr.entities.Employee;
import com.bitjester.apps.common.BaseEntity;

@Entity
@Table(name = "evaluations", uniqueConstraints = @UniqueConstraint(columnNames = { "evaluand", "evaluator", "survey" }))
public class Evaluation extends BaseEntity {
	private static final long serialVersionUID = 1L;

	@ManyToOne
	@JoinColumn(name = "evaluand")
	private Employee evaluand;
	@ManyToOne
	@JoinColumn(name = "evaluator")
	private Employee evaluator;
	@ManyToOne
	@JoinColumn(name = "survey")
	private Survey survey;
	private String relation;
	private Boolean completed = Boolean.FALSE;
	private Date cdate;
	// Keep historic data
	private String hevaluand;
	private String hcompany;
	private String hposition;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "evaluation", orphanRemoval = true)
	@OrderColumn(name = "qindex")
	private List<Answer> answers;

	// --- Methods ---//
	// --- Getters & Setters --- //
	public Employee getEvaluand() {
		return evaluand;
	}

	public void setEvaluand(Employee evaluand) {
		this.evaluand = evaluand;
	}

	public Employee getEvaluator() {
		return evaluator;
	}

	public void setEvaluator(Employee evaluator) {
		this.evaluator = evaluator;
	}

	public Survey getSurvey() {
		return survey;
	}

	public void setSurvey(Survey survey) {
		this.survey = survey;
	}

	public String getRelation() {
		return relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	public Boolean getCompleted() {
		return completed;
	}

	public void setCompleted(Boolean completed) {
		this.completed = completed;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public String getHevaluand() {
		return hevaluand;
	}

	public void setHevaluand(String hevaluand) {
		this.hevaluand = hevaluand;
	}

	public String getHcompany() {
		return hcompany;
	}

	public void setHcompany(String hcompany) {
		this.hcompany = hcompany;
	}

	public String getHposition() {
		return hposition;
	}

	public void setHposition(String hposition) {
		this.hposition = hposition;
	}

	public List<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

}
