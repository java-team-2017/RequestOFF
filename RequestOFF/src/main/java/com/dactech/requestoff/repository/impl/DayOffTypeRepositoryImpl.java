package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.DayOffType;
import com.dactech.requestoff.model.request.DayOffTypeSearchRequest;
import com.dactech.requestoff.repository.custom.DayOffTypeRepositoryCustom;

public class DayOffTypeRepositoryImpl implements DayOffTypeRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;

	@SuppressWarnings({ "unchecked" })
	@Override
	public List<DayOffType> search(DayOffTypeSearchRequest dayOffTypeSearchRequest) {
		boolean whereClause = true;
		StringBuilder sqlQuery = new StringBuilder("SELECT * FROM day_off_type ");

		if (dayOffTypeSearchRequest.getId() != 0) {
			sqlQuery.append(" WHERE id = '" + dayOffTypeSearchRequest.getId() + "'");
			whereClause = false;
		}

		if (dayOffTypeSearchRequest.getName() != null && dayOffTypeSearchRequest.getName() != "") {
			if (dayOffTypeSearchRequest.getNameMatchStatus() != 1) {
				String sqlString = whereClause ? " WHERE " : "";
				sqlQuery.append(sqlString + "name like '%" + dayOffTypeSearchRequest.getName() + "%'");
				whereClause = false;
			} else {
				String sqlString = whereClause ? " WHERE " : "";
				sqlQuery.append(sqlString + "name = '" + dayOffTypeSearchRequest.getName() + "'");
				whereClause = false;
			}
		}

		if (dayOffTypeSearchRequest.getPaymentFlag() != -1) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + " payment_flag = '" + dayOffTypeSearchRequest.getPaymentFlag() + "'");
			whereClause = false;
		}

		if (dayOffTypeSearchRequest.getValidFlag() != 0) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + "valid_flag = '" + dayOffTypeSearchRequest.getValidFlag() + "'");
		}

		Query query = entityManager.createNativeQuery(sqlQuery.toString(), DayOffType.class);
		return query.getResultList();
	}

}
