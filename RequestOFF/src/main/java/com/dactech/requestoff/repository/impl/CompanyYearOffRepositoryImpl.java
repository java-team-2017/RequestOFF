package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.CompanyYearOff;
import com.dactech.requestoff.model.request.CompanyYearOffDetailsRequest;
import com.dactech.requestoff.repository.custom.CompanyYearOffRepositoryCustom;

public class CompanyYearOffRepositoryImpl implements CompanyYearOffRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public CompanyYearOff details(CompanyYearOffDetailsRequest companyYearOffDetailsRequest) {
		String sqlQuery = "SELECT * FROM company_year_off WHERE id = " + companyYearOffDetailsRequest.getId();
		Query query = entityManager.createNativeQuery(sqlQuery, CompanyYearOff.class);
		List<CompanyYearOff> listCompanyYearOff = query.getResultList();
		
		if(listCompanyYearOff.size() > 0) {
			return listCompanyYearOff.get(0);
		}
		else {
			return new CompanyYearOff();
		}
	}
}
