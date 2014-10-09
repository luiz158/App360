package com.bitjester.apps.cfa.surveys.views;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;

import com.bitjester.apps.cfa.surveys.entities.Evaluation;
import com.bitjester.apps.cfa.surveys.entities.Survey;
import com.bitjester.apps.common.login.AppSession;
import com.bitjester.apps.common.utils.FacesUtil;
import com.bitjester.apps.common.entities.AppUser;

@Named
@ViewScoped
public class ViewPending implements Serializable {
	private static final long serialVersionUID = 1L;

	@Inject
	private AppSession appSession;

	@Inject
	private EntityManager em;

	// ================================
	// ======= Evaluation Methods =====
	// ================================

	@RequestScoped
	public List<Survey> getPendingSurveys() throws Exception {
		if (null == appSession.getActiveUser() || null == appSession.getActiveUser().getEmployee())
			return null;

		AppUser user = appSession.getActiveUser();
		String query = "FROM Survey WHERE id IN (";
		query += "SELECT DISTINCT(survey.id) FROM Evaluation";
		query += " WHERE evaluator.id=" + user.getEmployee().getId() + " AND completed=FALSE";
		query += ") AND active=TRUE ORDER BY id";
		return em.createQuery(query, Survey.class).getResultList();
	}

	@RequestScoped
	public List<Evaluation> pendingEvaluationsForSurvey(Long survey) throws Exception {
		AppUser user = appSession.getActiveUser();
		String query = "FROM Evaluation WHERE evaluator.id=" + user.getEmployee().getId();
		query += " AND survey.id=" + survey + " AND completed=FALSE";
		query += " ORDER BY evaluand.lname, evaluand.fname";
		return em.createQuery(query, Evaluation.class).getResultList();
	}
	
	public void evalURL(Long eval_id){
		FacesUtil.getFlash().put("evaluation", eval_id);
		FacesUtil.navTo("forms/evaluation.xhtml");
	}
}