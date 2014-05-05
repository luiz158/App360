package com.bitjester.apps.cfa.surveys.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.bitjester.apps.common.BaseEntity;

@Entity
@Table(name = "answers")
public class Answer extends BaseEntity {
	private static final long serialVersionUID = 1L;

	@ManyToOne
	@JoinColumn(name = "question")
	private Question question;
	@ManyToOne
	@JoinColumn(name = "evaluation")
	private Evaluation evaluation;
	private Integer qindex;
	private Integer nvalue;
	@Column(length = 510)
	private String tvalue;

	// --- Methods ---//
	// --- Getters & Setters --- //
	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public Evaluation getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(Evaluation evaluation) {
		this.evaluation = evaluation;
	}

	public Integer getQindex() {
		return qindex;
	}

	public void setQindex(Integer qindex) {
		this.qindex = qindex;
	}

	public Integer getNvalue() {
		return nvalue;
	}

	public void setNvalue(Integer nvalue) {
		this.nvalue = nvalue;
	}

	public String getTvalue() {
		return tvalue;
	}

	public void setTvalue(String tvalue) {
		this.tvalue = tvalue;
	}
}
