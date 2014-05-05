package com.bitjester.apps.cfa.surveys.views;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.enterprise.inject.Produces;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;

import com.bitjester.apps.cfa.surveys.entities.Question;
import com.bitjester.apps.cfa.surveys.entities.Survey;
import com.bitjester.apps.common.utils.BookKeeper;

@Named
@ViewScoped
public class ViewSurveys implements Serializable {
	private static final long serialVersionUID = 1L;

	@Inject
	private BookKeeper bk;

	@Inject
	private EntityManager em;

	private Question managedQuestion;
	private Survey managedSurvey;

	// ================================
	// ======= Question Methods =======
	// ================================
	public Question getManagedQuestion() {
		return managedQuestion;
	}

	public void setManagedQuestion(Question managedQuestion) {
		this.managedQuestion = managedQuestion;
	}

	public void newQuestion() {
		managedQuestion = new Question();
	}

	public void refreshQuestion() {
		managedQuestion = null;
	}

	public void loadQuestion(Question q) {
		managedQuestion = q;
	}

	public void removeQuestion(Question q) {
		managedSurvey.getQuestions().remove(q);
	}

	public void storeQuestion() {
		int i = managedSurvey.getQuestions().indexOf(managedQuestion);
		if (-1 == i)
			managedSurvey.getQuestions().add(managedQuestion);
		else
			managedSurvey.getQuestions().add(i, managedQuestion);
		managedQuestion.setSurvey(managedSurvey);
		managedQuestion = null;
	}

	// ================================
	// ======= Survey Methods =========
	// ================================
	@Named
	@Produces
	@RequestScoped
	public List<Survey> getSurveys() throws Exception {
		String query = "FROM Survey ORDER BY id";
		return em.createQuery(query, Survey.class).getResultList();
	}

	@Named
	@Produces
	@RequestScoped
	public List<Survey> getActiveSurveys() throws Exception {
		String query = "FROM Survey WHERE active=TRUE ORDER BY id";
		return em.createQuery(query, Survey.class).getResultList();
	}

	@Named
	@Produces
	public Survey getManagedSurvey() {
		return managedSurvey;
	}

	public void setManagedSurvey(Survey managedSurvey) {
		this.managedSurvey = managedSurvey;
	}

	public void newSurvey() {
		managedSurvey = new Survey();
	}

	public void refreshSurvey() {
		managedSurvey = null;
	}

	public void load(Long id) throws Exception {
		managedSurvey = em.find(Survey.class, id);
	}

	public void remove(Long id) throws Exception {
		Survey survey = em.find(Survey.class, id);
		bk.remove(survey);
	}

	public void store() throws Exception {
		bk.store(managedSurvey);
		managedSurvey = null;
	}
}
