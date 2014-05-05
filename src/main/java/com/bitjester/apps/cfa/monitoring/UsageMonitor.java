package com.bitjester.apps.cfa.monitoring;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.bitjester.apps.cfa.surveys.entities.Survey;
import com.bitjester.apps.common.entities.AppUser;

@Named
@ViewScoped
public class UsageMonitor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Inject
	private EntityManager em;

	// --------------------------------
	// ------- AppUser methods --------
	// --------------------------------

	@RequestScoped
	public List<AppUser> getLatestUsers() throws Exception {
		String query = "FROM AppUser WHERE lastLogin IS NOT NULL ORDER BY lastLogin DESC";
		TypedQuery<AppUser> result = em.createQuery(query, AppUser.class);
		return result.setFirstResult(0).setMaxResults(10).getResultList();
	}

	public Long getLoggedUsers() throws Exception {
		String query = "SELECT COUNT(id) FROM AppUser WHERE lastLogin > lastLogout";
		return em.createQuery(query, Long.class).getSingleResult();
	}

	// --------------------------------
	// ------- Survey methods --------
	// --------------------------------

	@RequestScoped
	public List<Survey> getActiveSurveys() throws Exception {
		String query = "FROM Survey WHERE active=TRUE ORDER BY id";
		return em.createQuery(query, Survey.class).getResultList();
	}

	public Long getCountEvaluations(Long survey) throws Exception {
		String query = "SELECT COUNT(id) FROM Evaluation WHERE survey.id=" + survey;
		return em.createQuery(query, Long.class).getSingleResult();
	}

	public Float getSurveyProgress(Long survey) throws Exception {
		Long assigned, completed;
		String query = "SELECT COUNT(id) FROM Evaluation WHERE survey.id=" + survey;
		assigned = em.createQuery(query, Long.class).getSingleResult();
		query += " AND completed=TRUE";
		completed = em.createQuery(query, Long.class).getSingleResult();
		if (0L == assigned.longValue())
			return Float.valueOf(0);
		return Float.parseFloat(new DecimalFormat("#.##").format(100.0F * completed / assigned));
	}
}
