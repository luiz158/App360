package com.bitjester.apps.cfa.surveys.views;

import java.util.ArrayList;
import java.util.List;

import com.bitjester.apps.cfa.hhrr.entities.Employee;

public class EvaluationSet {
	private Employee evaluand;
	private List<Employee> evaluators = new ArrayList<Employee>(0);
	private List<Boolean> willEvaluate;

	// ================================
	// ======= Getters & Setters ======
	// ================================
	public Employee getEvaluand() {
		return evaluand;
	}

	public void setEvaluand(Employee evaluand) {
		this.evaluand = evaluand;
	}

	public List<Employee> getEvaluators() {
		return evaluators;
	}

	public void setEvaluators(List<Employee> evaluators) {
		this.evaluators = evaluators;
	}

	public List<Boolean> getWillEvaluate() {
		return willEvaluate;
	}

	public void setWillEvaluate(List<Boolean> willEvaluate) {
		this.willEvaluate = willEvaluate;
	}

}
