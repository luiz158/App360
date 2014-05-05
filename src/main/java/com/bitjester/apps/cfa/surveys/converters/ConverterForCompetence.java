package com.bitjester.apps.cfa.surveys.converters;

import javax.enterprise.context.RequestScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;

import com.bitjester.apps.cfa.surveys.entities.Competence;
import com.bitjester.apps.common.BaseEntity;

@Named
@RequestScoped
public class ConverterForCompetence implements Converter {
	@Inject
	private EntityManager em;

	@Override
	public Object getAsObject(FacesContext arg0, UIComponent arg1, String arg2) {
		if (null != arg2 && !arg2.contains("---"))
			return em.find(Competence.class, Long.valueOf(arg2));
		return null;
	}

	@Override
	public String getAsString(FacesContext arg0, UIComponent arg1, Object arg2) {
		if (null != arg2 && arg2 instanceof BaseEntity)
			return ((BaseEntity) arg2).getId().toString();
		return null;
	}

}
