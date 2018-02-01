package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.DayOffType;
import com.dactech.requestoff.model.request.DayOffTypeSearchRequest;
import com.dactech.requestoff.repository.custom.DayOffTypeRepositoryCustom;
import com.dactech.requestoff.util.StringUtil;

public class DayOffTypeRepositoryImpl implements DayOffTypeRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;

	@SuppressWarnings({ "unchecked" })
	@Override
	public List<DayOffType> search(DayOffTypeSearchRequest dayOffTypeSearchRequest) {
		String sqlQuery = "SELECT * FROM day_off_type";
		if(StringUtil.isNotEmpty(dayOffTypeSearchRequest.getId())) {
			sqlQuery += " AND id = " + dayOffTypeSearchRequest.getId();
		}
		if(StringUtil.isNotEmpty(dayOffTypeSearchRequest.getName())) {
			if(StringUtil.isNotEmpty(dayOffTypeSearchRequest.getNameMatchStatus()) 
					&& dayOffTypeSearchRequest.getNameMatchStatus().equals("1")) {
				sqlQuery += " AND name = '" + dayOffTypeSearchRequest.getName() + "'";
			}
			else {
				sqlQuery += " AND name like '%" + dayOffTypeSearchRequest.getName() + "%'";
			}
		}
		if(StringUtil.isNotEmpty(dayOffTypeSearchRequest.getPaymentFlag())) {
			sqlQuery += " AND payment_flag = " + dayOffTypeSearchRequest.getPaymentFlag();
		}
		if(StringUtil.isNotEmpty(dayOffTypeSearchRequest.getValidFlag())) {
			sqlQuery += " AND valid_flag = " + dayOffTypeSearchRequest.getValidFlag();
		}
		
		if(sqlQuery.indexOf("AND") >= 0) {
			sqlQuery = sqlQuery.replaceFirst("AND", "WHERE");
		}
		
		Query query = entityManager.createNativeQuery(sqlQuery, DayOffType.class);
		
		List<DayOffType> listDayOffType = query.getResultList();
		return listDayOffType;
	}

}
