package com.bitjester.apps.app360.surveys.views;

import java.io.Serializable;

import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;

import com.bitjester.apps.app360.hhrr.entities.Employee;
import com.bitjester.apps.app360.surveys.entities.Evaluation;
import com.bitjester.apps.app360.surveys.entities.Survey;
import com.bitjester.apps.common.utils.BookKeeper;

@Named
@ViewScoped
public class ViewAssignments implements Serializable {
	private static final long serialVersionUID = 1L;

	@Inject
	private BookKeeper bk;

	@Inject
	private EntityManager em;

	private EvaluationSet evalSet;
	private Survey survey;

	// ================================
	// ======= Evaluation Methods =====
	// ================================
	@SuppressWarnings("unused")
	private Boolean evaluationExists(Employee evaluand, Employee evaluator) throws Exception {
		String query = "FROM Evaluation e WHERE e.survey.id =" + survey.getId();
		query += " AND e.evaluand.id=" + evaluand.getId() + " AND e.evaluator.id=" + evaluator.getId();
		return 1 == em.createQuery(query, Evaluation.class).getResultList().size();
	}

	public void removeEvaluation(Long id) throws Exception {
		Evaluation e = em.find(Evaluation.class, id);
		if (null != e) {
			bk.remove(e);
		}
	}

	public void refreshEvaluation(Long id) throws Exception {
		Evaluation e = em.find(Evaluation.class, id);
		if (null != e) {
			if (e.getCompleted()) {
				e.setCompleted(Boolean.FALSE);
				bk.store(e);
			}
		}
	}

	// ================================
	// ======= EvaluationSet Methods ==
	// ================================
	public void loadEvaluationSet(Long id) throws Exception {
		evalSet = new EvaluationSet();
		Employee evaluand = em.find(Employee.class, id);
		evalSet.setEvaluand(evaluand);
	}

	// ================================
	// ======= Getters & Setters ======
	// ================================

	public EvaluationSet getEvalSet() {
		return evalSet;
	}

	public void setEvalSet(EvaluationSet evalSet) {
		this.evalSet = evalSet;
	}

	public Survey getSurvey() {
		return survey;
	}

	public void setSurvey(Survey survey) {
		this.survey = survey;
	}

}
