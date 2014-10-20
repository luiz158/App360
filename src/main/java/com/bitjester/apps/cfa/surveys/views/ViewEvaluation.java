package com.bitjester.apps.cfa.surveys.views;

import java.io.Serializable;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;

import javax.annotation.PostConstruct;
import javax.enterprise.inject.Produces;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;

import com.bitjester.apps.cfa.surveys.entities.Answer;
import com.bitjester.apps.cfa.surveys.entities.Behavior;
import com.bitjester.apps.cfa.surveys.entities.Competence;
import com.bitjester.apps.cfa.surveys.entities.Evaluation;
import com.bitjester.apps.cfa.surveys.entities.Question;
import com.bitjester.apps.common.utils.BookKeeper;
import com.bitjester.apps.common.utils.FacesUtil;

@Named
@ViewScoped
public class ViewEvaluation implements Serializable {
	private static final long serialVersionUID = 1L;

	@Inject
	private BookKeeper bk;

	@Inject
	private EntityManager em;

	@Inject
	private Logger logger;

	private int index = 0;
	private List<Competence> competencies;
	private Evaluation managedEvaluation;

	@PostConstruct
	private void init() {
		try {
			load((Long) FacesUtil.getFlash().get("evaluation"));
			FacesUtil.getFlash().clear();
		} catch (Exception e) {
			logger.info(e.getMessage());
			//e.printStackTrace();
		}
	}

	// ================================
	// ======= Evaluation Methods =====
	// ================================

	public void load(Long id) throws Exception {
		managedEvaluation = initialize(id);
		index = 0;
		competencies = getCompetenciesForEvaluation();
	}

	public void finish() throws Exception {
		managedEvaluation.setCompleted(Boolean.TRUE);
		managedEvaluation.setCdate(new Date(System.currentTimeMillis()));
		managedEvaluation = (Evaluation) bk.store(managedEvaluation);
		FacesUtil.navTo("forms/evaluations.xhtml");
	}

	private Evaluation initialize(Long id) throws Exception {
		Evaluation e = em.find(Evaluation.class, id);

		if (0 == e.getAnswers().size()) {
			Answer a;
			Integer i = Integer.valueOf(0);
			Iterator<Question> ite = e.getSurvey().getQuestions().iterator();

			while (ite.hasNext()) {
				Question q = ite.next();
				if (null != q) {
					a = new Answer();
					a.setEvaluation(e);
					a.setQuestion(q);
					a.setQindex(i++);
					e.getAnswers().add(a);
					bk.store(a);
				}
			}
			e = (Evaluation) bk.store(e);
		}
		return e;
	}

	// ================================
	// ======= Behavior Methods =======
	// ================================

	public void nextQ() throws Exception {
		if (index < competencies.size() - 1)
			index++;
		managedEvaluation = (Evaluation) bk.store(managedEvaluation);

	}

	public void prevQ() throws Exception {
		if (index > 0)
			index--;
		managedEvaluation = (Evaluation) bk.store(managedEvaluation);
	}

	private List<Competence> getCompetenciesForEvaluation() {
		String query = "FROM Competence WHERE id IN (";
		query += "SELECT DISTINCT(behavior.competence.id) FROM Question";
		query += " WHERE survey.id=" + managedEvaluation.getSurvey().getId();
		query += ") ORDER BY id";
		return em.createQuery(query, Competence.class).getResultList();
	}

	public List<Behavior> getBehaviorsForCompetence() {
		String query = "FROM Behavior WHERE id IN (";
		query += "SELECT DISTINCT(behavior.id) FROM Question";
		query += " WHERE survey.id=" + managedEvaluation.getSurvey().getId();
		query += " AND behavior.competence.id="
				+ competencies.get(index).getId();
		query += ") ORDER BY id";
		return em.createQuery(query, Behavior.class).getResultList();
	}

	public List<Question> questionsForBehavior(Long id) {
		String query = "FROM Question WHERE survey.id="
				+ managedEvaluation.getSurvey().getId();
		query += " AND behavior.id=" + id;
		query += " ORDER BY qindex";
		return em.createQuery(query, Question.class).getResultList();
	}

	// ================================
	// ======= Getters & Setters ======
	// ================================

	@Named
	@Produces
	public int getIndex() {
		return index;
	}

	@Named
	@Produces
	public int getStop() {
		return competencies.size();
	}

	public Competence getCompetence() {
		return competencies.get(index);
	}

	@Named
	@Produces
	public Evaluation getManagedEvaluation() {
		return managedEvaluation;
	}

	public void setManagedEvaluation(Evaluation managedEvaluation)
			throws Exception {
		this.managedEvaluation = managedEvaluation;
		load(managedEvaluation.getId());
	}
}