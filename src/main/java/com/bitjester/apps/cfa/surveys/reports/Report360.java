package com.bitjester.apps.cfa.surveys.reports;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;

import org.primefaces.model.chart.CartesianChartModel;
import org.primefaces.model.chart.ChartSeries;

import com.bitjester.apps.cfa.hhrr.entities.Employee;
import com.bitjester.apps.cfa.surveys.entities.Answer;
import com.bitjester.apps.cfa.surveys.entities.Behavior;
import com.bitjester.apps.cfa.surveys.entities.Competence;
import com.bitjester.apps.cfa.surveys.entities.Question;
import com.bitjester.apps.cfa.surveys.entities.Survey;
import com.bitjester.apps.common.utils.FacesUtil;

@Named
@RequestScoped
public class Report360 implements Serializable {
	private static final long serialVersionUID = 1L;

	@Inject
	private EntityManager em;

	private Employee employee;
	private Survey survey;
	private List<Behavior> behaviors;
	private List<Double> scores;

	@PostConstruct
	private void init() {
		employee = em
				.find(Employee.class, FacesUtil.getFlash().get("employee"));
		survey = em.find(Survey.class, FacesUtil.getFlash().get("survey"));
		FacesUtil.getFlash().clear();

		// Initializing behaviors & scores
		behaviors = new ArrayList<>();
		scores = new ArrayList<>();

		try {
			for (Competence c : getCompetencies()) {
				for (Behavior b : getBehaviorsForCompetence(c.getId())) {
					insertScoreforBehavior(b, behaviorScore(b.getId(), employee, null, 1));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void insertScoreforBehavior(Behavior behavior, Double score) {
		int i = 0;
		for (Double s : scores) {
			if (s > score)
				i++;
		}
		behaviors.add(i, behavior);
		scores.add(i, score);
	}

	public Map<String, Double> getLowBehaviors() {
		int i = behaviors.size() - 1;
		int j = i - 3;
		Map<String, Double> m = new LinkedHashMap<>();
		for (; i > j; i--)
			m.put(behaviors.get(i).getName(), scores.get(i));
		return m;
	}

	public Map<String, Double> getTopBehaviors() {
		int i = 0;
		Map<String, Double> m = new LinkedHashMap<>();
		for (; i < 3; i++)
			m.put(behaviors.get(i).getName(), scores.get(i));
		return m;
	}

	public List<Competence> getCompetencies() throws Exception {
		String query = "FROM Competence WHERE id IN (";
		query += "SELECT DISTINCT(behavior.competence.id) FROM Question";
		query += " WHERE survey.id =" + survey.getId();
		query += " AND open =FALSE";
		query += ") ORDER BY id";
		return em.createQuery(query, Competence.class).getResultList();
	}

	public List<Behavior> getBehaviorsForCompetence(Long competence)
			throws Exception {
		String query = "FROM Behavior WHERE id IN (";
		query += "SELECT DISTINCT(behavior.id) FROM Question";
		query += " WHERE survey.id =" + survey.getId();
		query += " AND behavior.competence.id =" + competence;
		query += " AND open =FALSE";
		query += ") ORDER BY id";
		return em.createQuery(query, Behavior.class).getResultList();
	}

	public List<Question> getOpenQuestions() throws Exception {
		String query = "FROM Question WHERE survey.id =" + survey.getId();
		query += " AND behavior.competence.id =7";
		query += " ORDER BY behavior.id";
		return em.createQuery(query, Question.class).getResultList();
	}

	public List<Question> getCompetenceOpenQuestions(Long competence)
			throws Exception {
		String query = "FROM Question WHERE survey.id =" + survey.getId();
		query += " AND behavior.competence.id =" + competence;
		query += " ORDER BY behavior.id";
		return em.createQuery(query, Question.class).getResultList();
	}

	public List<Answer> getAnswersQuestions(Long question) throws Exception {
		String query = "FROM Answer WHERE question.id =" + question;
		query += " AND evaluation.evaluand.id =" + employee.getId();
		query += " AND tvalue IS NOT NULL";
		query += " AND LENGTH(tvalue) > 0";
		return em.createQuery(query, Answer.class).getResultList();
	}

	private Double behaviorScore(Long behavior, Employee employee,
			Employee evaluator, int mode) {
		try {
			String query = "SELECT Avg(nvalue) FROM Answer WHERE evaluation.completed =TRUE";
			query += " AND question.survey.id =" + survey.getId();
			query += " AND question.behavior.id =" + behavior;
			query += " AND question.open =FALSE";
			query += evalMode(employee, evaluator, mode);
			return formatResult(em.createQuery(query, Double.class)
					.getSingleResult());
		} catch (Exception e) {
			return 0D;
		}
	}

	private Double competenceScore(Long competence, Employee employee,
			Employee evaluator, int mode) {
		try {
			String query = "SELECT Avg(nvalue) FROM Answer WHERE evaluation.completed =TRUE";
			query += " AND question.survey.id =" + survey.getId();
			query += " AND question.behavior.competence.id =" + competence;
			query += " AND question.open =FALSE";
			query += evalMode(employee, evaluator, mode);
			return formatResult(em.createQuery(query, Double.class)
					.getSingleResult());
		} catch (Exception e) {
			return 0D;
		}
	}

	private Double overAllScore(Employee employee, Employee evaluator, int mode) {
		try {
			String query = "SELECT Avg(nvalue) FROM Answer WHERE evaluation.completed =TRUE";
			query += " AND question.survey.id =" + survey.getId();
			query += " AND question.open =FALSE";
			query += evalMode(employee, evaluator, mode);
			return formatResult(em.createQuery(query, Double.class)
					.getSingleResult());
		} catch (Exception e) {
			return 0D;
		}
	}

	// Aux method for general 360 report.
	public Double Score360(Employee employee, Employee evaluator,
			Survey survey, int mode) {
		try {
			String query = "SELECT Avg(nvalue) FROM Answer WHERE evaluation.completed =TRUE";
			query += " AND question.survey.id =" + survey.getId();
			query += " AND question.open =FALSE";
			query += evalMode(employee, evaluator, mode);
			return formatResult(em.createQuery(query, Double.class)
					.getSingleResult());
		} catch (Exception e) {
			return 0D;
		}
	}

	private String evalMode(Employee employee, Employee evaluator, int mode) {
		String modeString = "";
		switch (mode) {
		case -1:
			// Boss evaluation score
			modeString += " AND evaluation.evaluand.id =" + employee.getId();
			modeString += " AND evaluation.evaluator.id =" + evaluator.getId();
			break;

		case 0:
			// Auto evaluation score
			modeString += " AND evaluation.evaluand.id =" + employee.getId();
			modeString += " AND evaluation.evaluator.id =" + employee.getId();
			break;

		default:
			// Evaluation score for competence excluding auto-evaluation
			modeString += " AND evaluation.evaluand.id =" + employee.getId();
			modeString += " AND evaluation.evaluator.id <>" + employee.getId();
			// if (null != evaluator) {
			// modeString += " AND evaluation.evaluator.id <>" +
			// evaluator.getId();
			// }
			break;
		}
		return modeString;
	}

	// ================================
	// ======= Getters & Setters ======
	// ================================

	public Employee getEmployee() {
		return employee;
	}

	public Survey getSurvey() {
		return survey;
	}

	// ================================
	// ========== Helpers =============
	// ================================

	public String scoreImage(Double score) {
		if (0 == score)
			return "wScore.png";
		if (5 <= score)
			return "bScore.png";
		if (3 <= score)
			return "gScore.png";
		if (2 <= score)
			return "yScore.png";
		return "rScore.png";
	}

	public CartesianChartModel getBehaviorBC(Long behavior) {
		CartesianChartModel barChart = new CartesianChartModel();
		ChartSeries cboss = new ChartSeries();
		ChartSeries cauto = new ChartSeries();
		ChartSeries celse = new ChartSeries();

		cboss.setLabel("Jefe");
		cauto.setLabel("Auto");
		celse.setLabel("Otros");

		cboss.set("Q", bossBehaviorScore(behavior));
		cauto.set("Q", autoBehaviorScore(behavior));
		celse.set("Q", elseBehaviorScore(behavior));

		barChart.addSeries(celse);
		barChart.addSeries(cauto);
		barChart.addSeries(cboss);
		return barChart;
	}

	private Double formatResult(Double number) throws NumberFormatException {
		return Double.parseDouble(new DecimalFormat("#.##")
				.format(1.0D * number));
	}

	public Double getAutoOverallScore() {
		return overAllScore(employee, employee, 0);
	}

	public Double getBossOverallScore() {
		return overAllScore(employee, employee.getBoss(), -1);
	}

	public Double getElseOverallScore() {
		return overAllScore(employee, null, 1);
	}

	public Double autoCompetenceScore(Long competence) {
		return competenceScore(competence, employee, employee, 0);
	}

	public Double bossCompetenceScore(Long competence) {
		return competenceScore(competence, employee, employee.getBoss(), -1);
	}

	public Double elseCompetenceScore(Long competence) {
		return competenceScore(competence, employee, null, 1);
	}

	public Double autoBehaviorScore(Long behavior) {
		return behaviorScore(behavior, employee, employee, 0);
	}

	public Double bossBehaviorScore(Long behavior) {
		return behaviorScore(behavior, employee, employee.getBoss(), -1);
	}

	public Double elseBehaviorScore(Long behavior) {
		return behaviorScore(behavior, employee, null, 1);
	}
}
