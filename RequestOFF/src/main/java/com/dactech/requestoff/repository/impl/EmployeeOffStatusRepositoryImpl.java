package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.EmployeeOffStatus;
import com.dactech.requestoff.model.request.EmployeeOffStatusDetailsRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatusSearchRequest;
import com.dactech.requestoff.repository.custom.EmployeeOffStatusRepositoryCustom;

public class EmployeeOffStatusRepositoryImpl implements EmployeeOffStatusRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public EmployeeOffStatus details(EmployeeOffStatusDetailsRequest employeeOffStatusDetailsRequest) {
		String sqlQuery = "SELECT * FROM employee_off_status WHERE year_id = "
				+ employeeOffStatusDetailsRequest.getYearId() + " AND employee_id = "
				+ employeeOffStatusDetailsRequest.getEmployeeId();
		Query query = entityManager.createNativeQuery(sqlQuery, EmployeeOffStatus.class);
		List<EmployeeOffStatus> listEmployeeOffStatus = query.getResultList();

		if (listEmployeeOffStatus.size() > 0) {
			return listEmployeeOffStatus.get(0);
		} else {
			return new EmployeeOffStatus();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EmployeeOffStatus> search(EmployeeOffStatusSearchRequest employeeOffStatusSearchRequest) {
		boolean whereClause = true;
		StringBuilder sqlQuery = new StringBuilder("SELECT * FROM employee_off_status ");
		if (employeeOffStatusSearchRequest.getYearId() != 0) {
			sqlQuery.append(" WHERE year_id = '" + employeeOffStatusSearchRequest.getYearId() + "'");
			whereClause = false;
		}

		if (employeeOffStatusSearchRequest.getEmployeeId() != 0) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + " employee_id = '" + employeeOffStatusSearchRequest.getEmployeeId() + "'");
			whereClause = false;
		}

		if (employeeOffStatusSearchRequest.getRemainHours() >= 0) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + " remain_hours = '" + employeeOffStatusSearchRequest.getRemainHours() + "'");
			whereClause = false;
		}

		if (employeeOffStatusSearchRequest.getTotalHours() > 0) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + " total_hours = '" + employeeOffStatusSearchRequest.getTotalHours() + "'");
			whereClause = false;
		}

		if (employeeOffStatusSearchRequest.getValidFlag() == 0 || employeeOffStatusSearchRequest.getValidFlag() == 1) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + " valid_flag = '" + employeeOffStatusSearchRequest.getValidFlag() + "'");
			whereClause = false;
		}

		Query query = entityManager.createNativeQuery(sqlQuery.toString(), EmployeeOffStatus.class);
		return query.getResultList();
	}
}
