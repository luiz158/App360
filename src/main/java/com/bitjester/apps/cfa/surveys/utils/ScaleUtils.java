package com.bitjester.apps.cfa.surveys.utils;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.enterprise.context.ApplicationScoped;
import javax.faces.model.SelectItem;
import javax.inject.Named;

@Named
@ApplicationScoped
public class ScaleUtils {
	private List<SelectItem> scales;
	private List<Map<String, Object>> scaleList;

	public ScaleUtils() {
		super();

		Map<String, Object> temp;
		scales = new ArrayList<SelectItem>(0);
		scaleList = new ArrayList<Map<String, Object>>(0);

		// --- Set all existing scales
		scales.add(new SelectItem("0", "360"));
		scales.add(new SelectItem("1", "Satisfacción"));

		// --- Set values for Scale: 0
		temp = new LinkedHashMap<String, Object>();
		temp.put("No sabe / no aplica", "0");
		temp.put("Nunca", "1");
		temp.put("Rara vez", "2");
		temp.put("Generalmente", "3");
		temp.put("Siempre", "4");
		scaleList.add(temp);
		
		temp = new LinkedHashMap<String, Object>();
		temp.put("Completamente insatisfecho", "0");
		temp.put("Insatisfecho", "1");
		temp.put("Satisfecho", "2");
		temp.put("Completamente satisfecho", "3");
		scaleList.add(temp);
	}

	public List<SelectItem> getScales() {
		return scales;
	}

	public List<Map<String, Object>> getScaleList() {
		return scaleList;
	}

}
