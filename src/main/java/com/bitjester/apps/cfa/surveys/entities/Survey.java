package com.bitjester.apps.cfa.surveys.entities;

import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OrderColumn;
import javax.persistence.Table;

import com.bitjester.apps.common.BaseEntity;

@Cacheable
@Entity
@Table(name = "surveys")
public class Survey extends BaseEntity {
	private static final long serialVersionUID = 1L;

	private String name;
	private String description;
	private Boolean active = Boolean.FALSE;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "survey", orphanRemoval = true)
	@OrderColumn(name = "qindex")
	private List<Question> questions;

	public void toogleActive() {
		if (active)
			active = Boolean.FALSE;
		else
			active = Boolean.TRUE;
	}

	// --- Methods ---//
	// --- QUestion Methods ---//
	// Direction (dir): -1 = Up, 1 = Down
	private void shitQuestion(int dir, Question q) {
		int index = questions.indexOf(q);
		questions.remove(q);
		questions.add(index + dir, q);
		reOrderIndex();
	}

	public void shiftQuestionUp(Question q) {
		shitQuestion(-1, q);
	}

	public void shiftQuestionDown(Question q) {
		shitQuestion(1, q);
	}

	private void reOrderIndex() {
		for (int i = 0; i < questions.size(); i++)
			questions.get(i).setQindex(i);
	}

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

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

}
