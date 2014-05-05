package com.bitjester.apps.cfa.hhrr.views;

import java.util.ArrayList;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.enterprise.inject.Produces;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;

import org.richfaces.ui.iteration.tree.TreeSelectionChangeEvent;
import org.richfaces.ui.iteration.tree.AbstractTree;

import com.bitjester.apps.cfa.entities.Brand;
import com.bitjester.apps.cfa.entities.Country;
import com.bitjester.apps.cfa.hhrr.entities.*;
import com.bitjester.apps.common.utils.*;

import java.io.Serializable;

@Named
@ViewScoped
public class ViewEmployee implements Serializable {
	private static final long serialVersionUID = 1L;

	@Inject
	private BookKeeper bk;

	@Inject
	private EntityManager em;

	private Brand brand;
	private Country country;
	private Employee managedEmployee;

	// ================================
	// ======= Brand Methods ==========
	// ================================

	@RequestScoped
	// Gets Brands for employees.
	public List<Brand> getBrands() throws Exception {
		String query = "FROM Brand WHERE id IN (";
		query += "SELECT DISTINCT brand.id FROM Employee WHERE active=TRUE";
		if (null != country)
			query += " AND country.id=" + country.getId();
		query += ") AND id>0 ORDER BY name";
		return em.createQuery(query, Brand.class).getResultList();
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	// ================================
	// ======= Country Methods ========
	// ================================

	@RequestScoped
	// Get Countries for employees.
	public List<Country> getCountries() throws Exception {
		String query = "FROM Country WHERE id IN (";
		query += "SELECT DISTINCT country.id FROM Employee WHERE active=TRUE";
		query += ") AND id>0 ORDER BY name";
		return em.createQuery(query, Country.class).getResultList();
	}

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	// ================================
	// ======= Tree Methods ===========
	// ================================

	@Named
	@Produces
	@RequestScoped
	public List<Employee> getRootEmployees() throws Exception {
		String query = "FROM Employee WHERE boss IS NULL AND active=TRUE";
		query += " ORDER BY lname, fname";
		return em.createQuery(query, Employee.class).getResultList();
	}

	@RequestScoped
	public Boolean isleaf(Long employee) throws Exception {
		String query = "SELECT COUNT(id) FROM Employee WHERE boss.id=" + employee;
		if (null != country)
			query += " AND country.id=" + country.getId();
		if (null != brand)
			query += " AND brand.id=" + brand.getId();
		query += " AND active=TRUE";
		return em.createQuery(query, Long.class).getSingleResult() == 0;
	}

	@RequestScoped
	public List<Employee> getChildren(Long employee) throws Exception {
		String query = "FROM Employee WHERE boss.id =" + employee;
		if (null != country)
			query += " AND country.id=" + country.getId();
		if (null != brand)
			query += " AND brand.id=" + brand.getId();
		query += " AND active=TRUE ORDER BY lname, fname";
		return em.createQuery(query, Employee.class).getResultList();
	}

	public void selectEmployeeNode(TreeSelectionChangeEvent e) {
		// TODO: Implement Node selection code to select managedEmployee.
		List<Object> selection = new ArrayList<Object>(e.getNewSelection());
		Object currentSelectionKey = selection.get(0);
		AbstractTree tn = (AbstractTree) e.getSource();
		tn.setSelection(null);

		Object storedKey = tn.getRowKey();
		tn.setRowKey(currentSelectionKey);
		managedEmployee = (Employee) tn.getRowData();
		tn.setRowKey(storedKey);
	}

	// ================================
	// ======= Listing Methods ========
	// ================================

	@RequestScoped
	// Returns first letters of employee's lastname.
	public List<String> getEmployeeStartLetters() throws Exception {
		String query = "SELECT DISTINCT UPPER(SUBSTRING(lname,1,1)) AS letter FROM Employee";
		query += " WHERE LENGTH(lname)>0";
		if (null != country)
			query += " AND country.id=" + country.getId();
		if (null != brand)
			query += " AND brand.id=" + brand.getId();
		else
			query += " AND brand.id>0";
		query += " AND active=TRUE ORDER BY letter";
		return em.createQuery(query, String.class).getResultList();
	}

	@RequestScoped
	// Gets employees whose lastname starts with :letter.
	public List<Employee> employeesForLetter(String letter) throws Exception {
		String query = "FROM Employee WHERE lname LIKE '" + letter + "%'";
		if (null != country)
			query += " AND country.id=" + country.getId();
		if (null != brand)
			query += " AND brand.id=" + brand.getId();
		else
			query += " AND brand.id>0";
		query += " AND active=TRUE ORDER BY lname, fname";
		return em.createQuery(query, Employee.class).getResultList();
	}

	// ================================
	// ======= Employee Methods =======
	// ================================

	@Named
	@Produces
	public Employee getManagedEmployee() {
		return managedEmployee;
	}

	public void setManagedEmployee(Employee managedEmployee) {
		this.managedEmployee = managedEmployee;
	}

	public void load(Long id) throws Exception {
		managedEmployee = em.find(Employee.class, id);
	}

	public void remove(Long id) throws Exception {
		Employee employee = em.find(Employee.class, id);
		if (null != employee) {
			// Remove associations
			transferChildrenToBoss(employee);
			removeEmployeeEvaluations(employee);
			removeEmployeeUser(employee);

			// Removes employee from boss' children
			employee.setBoss(null);
			employee = (Employee) bk.store(employee);

			// Removes employee
			bk.remove(employee);
			FacesUtil.addMessage("Empleado eliminado.");
		}
	}

	public void store() throws Exception {
		bk.store(managedEmployee);
		managedEmployee = null;
	}

	// Transfer all Subs to employee's boss
	private void transferChildrenToBoss(Employee e) throws Exception {
		List<Object> params = new ArrayList<Object>(0);

		// Transfers all children to employee's boss.
		params.add(e.getBoss());
		params.add(e);
		String query = "UPDATE Employee SET boss = ?0 WHERE boss = ?1";
		bk.executeUpdate(query, params);
	}

	// Delete all the evaluations where the employee is either evaluator or evaluand.
	private void removeEmployeeEvaluations(Employee e) throws Exception {
		List<Object> params = new ArrayList<Object>(0);
		params.add(e);

		// Delete all answers
		String query = "DELETE FROM Answer WHERE evaluation IN";
		query += " (FROM Evaluation WHERE evaluator = ?0 OR evaluand = ?0)";
		bk.executeUpdate(query, params);

		// Delete all evaluations
		query = "DELETE FROM Evaluation WHERE evaluator = ?0 OR evaluand = ?0";
		bk.executeUpdate(query, params);
	}

	// Delete role & user for an employee.
	private void removeEmployeeUser(Employee e) throws Exception {
		List<Object> params = new ArrayList<Object>(0);
		params.add(e);

		// Deletes role
		String query = "DELETE FROM AppRole WHERE system_user IN";
		query += " (FROM AppUser WHERE employee = ?0)";
		bk.executeUpdate(query, params);

		// Deletes user for employee
		query = "DELETE FROM AppUser WHERE employee = ?0";
		bk.executeUpdate(query, params);
	}
}
