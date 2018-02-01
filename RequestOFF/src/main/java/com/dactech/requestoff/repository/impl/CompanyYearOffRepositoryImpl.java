package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.CompanyYearOff;
import com.dactech.requestoff.model.request.CompanyYearOffSearchRequest;
import com.dactech.requestoff.repository.custom.CompanyYearOffRepositoryCustom;
import com.dactech.requestoff.util.StringUtil;

public class CompanyYearOffRepositoryImpl implements CompanyYearOffRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CompanyYearOff> search(CompanyYearOffSearchRequest companyYearOffSearchRequest) {
		String sqlQuery = "SELECT * FROM company_year_off";
		if(StringUtil.isNotEmpty(companyYearOffSearchRequest.getId())) {
			sqlQuery += " AND id = " + companyYearOffSearchRequest.getId();
		}
		if(StringUtil.isNotEmpty(companyYearOffSearchRequest.getDayOffResetFlag())) {
			sqlQuery += " AND day_off_reset_flag = " + companyYearOffSearchRequest.getDayOffResetFlag();
		}
		if(StringUtil.isNotEmpty(companyYearOffSearchRequest.getCurrentYearFlag())) {
			sqlQuery += " AND current_year_flag = " + companyYearOffSearchRequest.getCurrentYearFlag();
		}
		if(StringUtil.isNotEmpty(companyYearOffSearchRequest.getValidFlag())) {
			sqlQuery += " AND valid_flag = " + companyYearOffSearchRequest.getValidFlag();
		}
		
		if(sqlQuery.indexOf("AND") >= 0) {
			sqlQuery = sqlQuery.replaceFirst("AND", "WHERE");
		}
		
		Query query = entityManager.createNativeQuery(sqlQuery, CompanyYearOff.class);
		List<CompanyYearOff> listCompanyYearOff = query.getResultList();
		
		return listCompanyYearOff;
	}
	
}
