package com.bitjester.apps.common.views;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.enterprise.inject.Produces;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;

import com.bitjester.apps.app360.hhrr.entities.Employee;
import com.bitjester.apps.common.entities.AppUser;
import com.bitjester.apps.common.utils.BookKeeper;
import com.bitjester.apps.common.utils.FacesUtil;
import com.bitjester.apps.common.utils.HashUtil;

@Named
@ViewScoped
public class ViewUsers implements Serializable {
	private static final long serialVersionUID = 1L;

	@Inject
	private String appName;

	@Inject
	private BookKeeper bk;

	@Inject
	private EntityManager em;

	// -- Managed Objects
	private AppUser managedUser;

	// -- View methods
	@RequestScoped
	public List<String> getUserStartLetters() throws Exception {
		String query = "SELECT DISTINCT UPPER(SUBSTRING(employee.lname,1,1)) AS letter FROM AppUser";
		query += " WHERE LENGTH(employee.lname) > 0 ORDER BY letter";

		List<String> results = em.createQuery(query, String.class).getResultList();
		results.add(0, "-");
		return results;
	}

	@RequestScoped
	public List<AppUser> getUsersForLetter(String letter) throws Exception {
		String query;
		if (letter.contains("-")) {
			query = "FROM AppUser WHERE employee IS NULL";
			query += " ORDER BY username";
		} else {
			query = "FROM AppUser WHERE employee.lname LIKE '" + letter + "%'";
			query += " ORDER BY employee.lname, employee.fname";
		}
		return em.createQuery(query, AppUser.class).getResultList();
	}

	// ==== Batch user provisioning based on evaluators
	public void provisionUsers() throws Exception {
		String query = "SELECT DISTINCT(ev.evaluator) FROM Evaluation ev";
		query += " WHERE ev.evaluator.active = TRUE AND ev.evaluator.doc_id NOT IN";
		query += " (SELECT DISTINCT(username) FROM AppUser)";

		AppUser user;
		for(Employee emp : em.createQuery(query, Employee.class).getResultList()){
			user = new AppUser();
			user.setEmployee(emp);
			user.setName(emp.getFullName());
			user.setPassword(HashUtil.calc_HashSHA("123456"));
			user.setUsername(emp.getDoc_id());
			user.setAppRole(appName, "user");
			bk.store(user);
		}
	}

	// -- Persistence & form methods
	@Named
	@Produces
	public AppUser getManagedUser() {
		return managedUser;
	}

	public void setManagedUser(AppUser managedUser) {
		this.managedUser = managedUser;
	}

	public void load(Long id) throws Exception {
		managedUser = em.find(AppUser.class, id);
		managedUser.setActiveRole(managedUser.getAppRole(appName));
	}

	public void newInstance() {
		managedUser = new AppUser();
	}

	public void refresh() throws Exception {
		managedUser = null;
	}

	public void remove(Long id) {
		try {
			bk.remove(em.find(AppUser.class, id));
		} catch (Exception e) {
			FacesUtil.addMessage("Error ocurred, please reload page and try again.");
		}
	}

	public void store() {
		try {
			if (null == managedUser.getId()) {
				// New user will be assigned a 'user' role and default password.
				managedUser.setAppRole(appName, "user");
				managedUser.setPassword(HashUtil.calc_HashSHA("123456"));
			} else {
				// For existing users we update their role if necesary.
				managedUser.setAppRole(appName, managedUser.getActiveRole());
			}
			bk.store(managedUser);
			managedUser = null;
		} catch (Exception e) {
			FacesUtil.addMessage("Error ocurred, please reload page and try again.");
		}
	}
}
