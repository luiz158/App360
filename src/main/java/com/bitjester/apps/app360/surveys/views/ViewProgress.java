package com.bitjester.apps.app360.surveys.views;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;

import com.bitjester.apps.app360.entities.Brand;
import com.bitjester.apps.app360.entities.Country;
import com.bitjester.apps.app360.hhrr.entities.Employee;
import com.bitjester.apps.app360.surveys.entities.Evaluation;
import com.bitjester.apps.app360.surveys.entities.Survey;
import com.bitjester.apps.common.utils.FacesUtil;

@Named
@SessionScoped
public class ViewProgress implements Serializable {
	private static final long serialVersionUID = 1L;

	@Inject
	private EntityManager em;

	private Country country;
	private Brand brand;
	private Survey survey;
	private Employee employee;

	// ================================
	// ======= Filter Methods =========
	// ================================
	@RequestScoped
	public List<Survey> getEvaluationSurveys() throws Exception {
		String query = "FROM Survey WHERE id IN (";
		query += "SELECT DISTINCT(survey.id) FROM Evaluation";
		query += ") ORDER BY id";
		return em.createQuery(query, Survey.class).getResultList();
	}

	@RequestScoped
	public List<Country> getCountriesForEvaluators() throws Exception {
		if (null == survey)
			return null;
		String query = "FROM Country WHERE id IN (";
		query += "SELECT DISTINCT(evaluator.country.id) FROM Evaluation WHERE survey.id=" + survey.getId();
		query += ") ORDER BY name";
		return em.createQuery(query, Country.class).getResultList();
	}

	@RequestScoped
	public List<Country> getCountriesForEvaluands() throws Exception {
		if (null == survey)
			return null;
		String query = "FROM Country WHERE id IN (";
		query += "SELECT DISTINCT(evaluand.country.id) FROM Evaluation WHERE survey.id=" + survey.getId();
		query += ") ORDER BY name";
		return em.createQuery(query, Country.class).getResultList();
	}

	@RequestScoped
	public List<Brand> getBrandsForEvaluators() throws Exception {
		if (null == survey)
			return null;
		String query = "FROM Brand WHERE id IN (";
		query += "SELECT DISTINCT(evaluator.brand.id) FROM Evaluation WHERE survey.id=" + survey.getId();
		if (null != country)
			query += " AND evaluator.country.id=" + country.getId();
		query += ") ORDER BY name";
		return em.createQuery(query, Brand.class).getResultList();
	}

	@RequestScoped
	public List<Brand> getBrandsForEvaluands() throws Exception {
		if (null == survey)
			return null;
		String query = "FROM Brand WHERE id IN (";
		query += "SELECT DISTINCT(evaluand.brand.id) FROM Evaluation WHERE survey.id=" + survey.getId();
		if (null != country)
			query += " AND evaluand.country.id=" + country.getId();
		query += ") ORDER BY name";
		return em.createQuery(query, Brand.class).getResultList();
	}

	@RequestScoped
	public List<String> getEvaluatorStartLetters() throws Exception {
		if (null == survey)
			return null;
		String query = "SELECT DISTINCT UPPER(SUBSTRING(lname,1,1)) AS letter FROM Employee WHERE id IN (";
		query += "SELECT DISTINCT(evaluator.id) FROM Evaluation WHERE survey.id=" + survey.getId();
		if (null != country)
			query += " AND evaluator.country.id=" + country.getId();
		if (null != brand)
			query += " AND evaluator.brand.id=" + brand.getId();
		query += ") ORDER BY letter";
		return em.createQuery(query, String.class).getResultList();
	}

	@RequestScoped
	public List<String> getEvaluandStartLetters() throws Exception {
		if (null == survey)
			return null;
		String query = "SELECT DISTINCT UPPER(SUBSTRING(lname,1,1)) AS letter FROM Employee WHERE id IN (";
		query += "SELECT DISTINCT(evaluand.id) FROM Evaluation WHERE survey.id=" + survey.getId();
		if (null != country)
			query += " AND evaluand.country.id=" + country.getId();
		if (null != brand)
			query += " AND evaluand.brand.id=" + brand.getId();
		query += ") ORDER BY letter";
		return em.createQuery(query, String.class).getResultList();
	}

	@RequestScoped
	public List<Employee> getEvaluators(String letter) throws Exception {
		if (null == survey)
			return null;
		String query = "FROM Employee WHERE id IN (";
		query += "SELECT DISTINCT(evaluator.id) FROM Evaluation WHERE survey.id=" + survey.getId();
		if (null != country)
			query += " AND evaluator.country.id=" + country.getId();
		if (null != brand)
			query += " AND evaluator.brand.id=" + brand.getId();
		query += ") AND lname LIKE '" + letter + "%' ORDER BY lname, fname";
		return em.createQuery(query, Employee.class).getResultList();
	}

	@RequestScoped
	public List<Employee> getEvaluands(String letter) throws Exception {
		if (null == survey)
			return null;
		String query = "FROM Employee WHERE id IN (";
		query += "SELECT DISTINCT(evaluand.id) FROM Evaluation WHERE survey.id=" + survey.getId();
		if (null != country)
			query += " AND evaluand.country.id=" + country.getId();
		if (null != brand)
			query += " AND evaluand.brand.id=" + brand.getId();
		query += ") AND lname LIKE '" + letter + "%' ORDER BY lname, fname";
		return em.createQuery(query, Employee.class).getResultList();
	}

	public Float evaluatorProgress(Long id) throws Exception {
		Long assigned, completed;
		String query = "SELECT COUNT(id) FROM Evaluation WHERE evaluator.id=" + id;
		query += " AND survey.id=" + survey.getId();
		assigned = em.createQuery(query, Long.class).getSingleResult();
		query += " AND completed=TRUE";
		completed = em.createQuery(query, Long.class).getSingleResult();
		if (0L == assigned.longValue())
			return Float.valueOf(0);
		return Float.parseFloat(new DecimalFormat("#.##").format(100.0F * completed / assigned));
	}

	public Float evaluandProgress(Long id) throws Exception {
		Long assigned, completed;
		String query = "SELECT COUNT(id) FROM Evaluation WHERE evaluand.id=" + id;
		query += " AND survey.id=" + survey.getId();
		assigned = em.createQuery(query, Long.class).getSingleResult();
		query += " AND completed=TRUE";
		completed = em.createQuery(query, Long.class).getSingleResult();
		if (0L == assigned.longValue())
			return Float.valueOf(0);
		return Float.parseFloat(new DecimalFormat("#.##").format(100.0F * completed / assigned));
	}

	public Long getCountEvaluations(Long survey) {
		if (null == survey)
			return null;
		String query = "SELECT COUNT(id) FROM Evaluation WHERE survey.id=" + survey;
		if (null != country)
			query += " AND evaluator.country.id=" + country.getId();
		if (null != brand)
			query += " AND evaluator.brand.id=" + brand.getId();
		return em.createQuery(query, Long.class).getSingleResult();
	}

	public Float getSurveyProgress(Long survey) {
		if (null == survey)
			return null;
		Long assigned, completed;
		String query = "SELECT COUNT(id) FROM Evaluation WHERE survey.id=" + survey;
		if (null != country)
			query += " AND evaluator.country.id=" + country.getId();
		if (null != brand)
			query += " AND evaluator.brand.id=" + brand.getId();
		assigned = em.createQuery(query, Long.class).getSingleResult();
		query += " AND completed=TRUE";
		completed = em.createQuery(query, Long.class).getSingleResult();
		if (0L == assigned.longValue())
			return Float.valueOf(0);
		return Float.parseFloat(new DecimalFormat("#.##").format(100.0F * completed / assigned));
	}

	public void reportURL(Long emp_id) {
		FacesUtil.getFlash().put("survey",survey.getId());
		FacesUtil.getFlash().put("employee", emp_id);
		//System.out.println("Map1: " + FacesUtil.getFlash().toString());
		FacesUtil.navTo("reports/report" + survey.getId() + ".xhtml");
	}

	@RequestScoped
	public List<Employee> getAllEvaluators() throws Exception {
		if (null == survey)
			return null;
		String query = "FROM Employee WHERE id IN (";
		query += "SELECT DISTINCT(evaluator.id) FROM Evaluation WHERE survey.id=" + survey.getId();
		if (null != country)
			query += " AND evaluator.country.id=" + country.getId();
		if (null != brand)
			query += " AND evaluator.brand.id=" + brand.getId();
		query += ") ORDER BY country, brand, lname, fname";
		return em.createQuery(query, Employee.class).getResultList();
	}
	
	@RequestScoped
	public List<Employee> getAllEvaluands() throws Exception {
		if (null == survey)
			return null;
		String query = "FROM Employee WHERE id IN (";
		query += "SELECT DISTINCT(evaluand.id) FROM Evaluation WHERE survey.id=" + survey.getId();
		if (null != country)
			query += " AND evaluand.country.id=" + country.getId();
		if (null != brand)
			query += " AND evaluand.brand.id=" + brand.getId();
		query += ") ORDER BY country, brand, lname, fname";
		return em.createQuery(query, Employee.class).getResultList();
	}

	// ================================
	// ======= Evaluation lists =======
	// ================================
	public List<Evaluation> getEvaluands() throws Exception {
		if (null == survey || null == employee)
			return null;
		String query = "FROM Evaluation WHERE survey.id =" + survey.getId();
		query += " AND evaluator.id =" + employee.getId();
		query += " ORDER BY evaluand.lname, evaluand.fname";
		return em.createQuery(query, Evaluation.class).getResultList();
	}

	public List<Evaluation> getEvaluators() throws Exception {
		if (null == survey || null == employee)
			return null;
		String query = "FROM Evaluation WHERE survey.id =" + survey.getId();
		query += " AND evaluand.id =" + employee.getId();
		query += " ORDER BY evaluator.lname, evaluator.fname";
		return em.createQuery(query, Evaluation.class).getResultList();
	}

	public void prep(Employee e) {
		employee = e;
	}

	public void refresh() {
		employee = null;
	}

	// ================================
	// ======= Getters & Setters ======
	// ================================

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public Survey getSurvey() {
		return survey;
	}

	public void setSurvey(Survey survey) {
		this.survey = survey;
	}

	public Employee getEmployee() {
		return employee;
	}
}
