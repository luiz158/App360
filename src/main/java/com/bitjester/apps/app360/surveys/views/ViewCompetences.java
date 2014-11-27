package com.bitjester.apps.app360.surveys.views;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.enterprise.inject.Produces;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;

import com.bitjester.apps.app360.surveys.entities.Behavior;
import com.bitjester.apps.app360.surveys.entities.Competence;
import com.bitjester.apps.common.utils.BookKeeper;

@Named
@ViewScoped
public class ViewCompetences implements Serializable {
	private static final long serialVersionUID = 1L;

	@Inject
	private BookKeeper bk;

	@Inject
	private EntityManager em;

	private Behavior managedBehavior;
	private Competence managedCompetence;

	// ================================
	// ======= Behavior Methods =======
	// ================================
	@Named
	@Produces
	public Behavior getManagedBehavior() {
		return managedBehavior;
	}

	public void setManagedBehavior(Behavior managedBehavior) {
		this.managedBehavior = managedBehavior;
	}

	public void newBehavior() {
		managedBehavior = new Behavior();
	}

	public void refreshBehavior() {
		managedBehavior = null;
	}

	public void loadBehavior(Behavior b) {
		managedBehavior = b;
	}

	public void removeBehavior(Behavior b) {
		managedCompetence.getBehaviors().remove(b);
	}

	public void storeBehavior() {
		int i = managedCompetence.getBehaviors().indexOf(managedBehavior);
		if (-1 == i)
			managedCompetence.getBehaviors().add(managedBehavior);
		else
			managedCompetence.getBehaviors().add(i, managedBehavior);
		managedBehavior.setCompetence(managedCompetence);
		managedBehavior = null;
	}

	// ================================
	// ======= Competence Methods =====
	// ================================
	@Named
	@Produces
	@RequestScoped
	public List<Competence> getCompentencies() throws Exception {
		String query = "FROM Compentece ORDER BY name";
		return em.createQuery(query, Competence.class).getResultList();
	}

	@Named
	@Produces
	public Competence getManagedCompetence() {
		return managedCompetence;
	}

	public void setManagedCompetence(Competence managedCompetence) {
		this.managedCompetence = managedCompetence;
	}

	public void newCompetence() {
		managedCompetence = new Competence();
	}

	public void refreshCompetence() {
		managedCompetence = new Competence();
	}

	public void load(Long id) throws Exception {
		managedCompetence = em.find(Competence.class, id);
	}

	public void remove(Long id) throws Exception {
		Competence competence = em.find(Competence.class, id);
		bk.remove(competence);
	}

	public void store() throws Exception {
		bk.store(managedCompetence);
		managedCompetence = null;
	}
}
