package com.bitjester.apps.common.login;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.bitjester.apps.cfa.hhrr.entities.Employee;
import com.bitjester.apps.common.entities.AppUser;
import com.bitjester.apps.common.utils.BookKeeper;
import com.bitjester.apps.common.utils.FacesUtil;
import com.bitjester.apps.common.utils.HashUtil;

@Named
@Stateless
public class LoginManager {
	@Inject
	private String appName;

	@Inject
	EntityManager em;

	public void changePassword(AppUser user, String newPassword) throws Exception {
		user = em.merge(user);
		user.setPassword(HashUtil.calc_HashSHA(newPassword));
		if (user.getMustChangePassword())
			user.setMustChangePassword(Boolean.FALSE);
		logOutUser(user);
	}

	public AppUser checkCredentials(String user, String password) throws Exception {
		String query = "SELECT u FROM AppUser u WHERE u.active=TRUE";
		query += " AND u.username=:user_name AND u.password=:password";
		TypedQuery<AppUser> tQuery = em.createQuery(query, AppUser.class);
		tQuery.setParameter("user_name", user.trim());
		tQuery.setParameter("password", HashUtil.calc_HashSHA(password));
		List<AppUser> results = tQuery.getResultList();

		if (results.isEmpty()) {
			// User not found.
			return null;
		} else {
			BookKeeper.update(results.get(0), "0 - System");
			results.get(0).setLastLogin(new Date(System.currentTimeMillis()));
			em.flush();
			return results.get(0);
		}
	}

	public AppUser getUserForImpersonation(Long id) throws Exception {
		return em.find(AppUser.class, id);
	}

	public void logOutUser(AppUser user) throws Exception {
		user = em.find(AppUser.class, user.getId());
		BookKeeper.update(user, "0 - System");
		user.setLastLogout(new Date(System.currentTimeMillis()));
		em.flush();
	}

	public void resetEmployeePassword(String username) throws Exception {
		try {
			String query = "FROM User WHERE username='" + username + "'";
			AppUser user = em.createQuery(query, AppUser.class).getSingleResult();
			resetPassword(user.getId());
			FacesUtil.addMessage("La contraseña fue restablecida.");
		} catch (Exception e) {
			FacesUtil.addMessage("Este empleado no es evaluador.");
			throw e;
		}
	}

	public void resetPassword(Long userID) throws Exception {
		AppUser user = em.find(AppUser.class, userID);
		BookKeeper.update(user, "0 - System");
		user.setPassword(HashUtil.calc_HashSHA("123456"));
		user.setMustChangePassword(Boolean.TRUE);
		em.merge(user);
		em.flush();
	}

	// ==== Batch user provisioning based on evaluators
	public void provisionUsers() throws Exception {
		String query = "SELECT DISTINCT(ev.evaluator) FROM Evaluation ev";
		query += " WHERE ev.evaluator.active = TRUE AND ev.evaluator.doc_id NOT IN";
		query += " (SELECT DISTINCT(username) FROM User)";
		Iterator<Employee> ite = em.createQuery(query, Employee.class).getResultList().iterator();

		Employee emp;
		AppUser user;
		while (ite.hasNext()) {
			emp = ite.next();
			user = new AppUser();
			user.setEmployee(emp);
			user.setName(emp.getFullName());
			user.setPassword(HashUtil.calc_HashSHA("123456"));
			user.setUsername(emp.getDoc_id());
			user.setAppRole(appName, "user");
			em.persist(user);
		}
		em.flush();
	}
}
