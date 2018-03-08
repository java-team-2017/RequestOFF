package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.EmployeeOffStatus;
import com.dactech.requestoff.model.request.EmployeeOffStatusSearchRequest;
import com.dactech.requestoff.repository.custom.EmployeeOffStatusRepositoryCustom;
import com.dactech.requestoff.util.StringUtil;

public class EmployeeOffStatusRepositoryImpl implements EmployeeOffStatusRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public List<EmployeeOffStatus> search(EmployeeOffStatusSearchRequest employeeOffStatusSearchRequest) {
		boolean whereClause = true;
		StringBuilder sqlQuery = new StringBuilder("SELECT * FROM employee_off_status eOS INNER JOIN employee e ON eOS.employee_id = e.id ");
		if (StringUtil.isNotEmpty(employeeOffStatusSearchRequest.getEmployeeName())) {
			sqlQuery.append(" WHERE e.name like '%" + employeeOffStatusSearchRequest.getEmployeeName() + "%'");
			whereClause = false;
		}
		
		if (StringUtil.isNotEmpty(employeeOffStatusSearchRequest.getYearId())) {
			sqlQuery.append(" WHERE year_id = '" + employeeOffStatusSearchRequest.getYearId() + "'");
			whereClause = false;
		}
		
		if (StringUtil.isNotEmpty(employeeOffStatusSearchRequest.getEmployeeId())) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + " employee_id = '" + employeeOffStatusSearchRequest.getEmployeeId() + "'");
			whereClause = false;
		}

		if (StringUtil.isNotEmpty(employeeOffStatusSearchRequest.getRemainHours())) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + " remain_hours = '" + employeeOffStatusSearchRequest.getRemainHours() + "'");
			whereClause = false;
		}

		if (StringUtil.isNotEmpty(employeeOffStatusSearchRequest.getTotalHours())) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + " total_hours = '" + employeeOffStatusSearchRequest.getTotalHours() + "'");
			whereClause = false;
		}

		if (StringUtil.isNotEmpty(employeeOffStatusSearchRequest.getValidFlag())) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + " valid_flag = '" + employeeOffStatusSearchRequest.getValidFlag() + "'");
			whereClause = false;
		}

		Query query = entityManager.createNativeQuery(sqlQuery.toString(), EmployeeOffStatus.class);
		return query.getResultList();
	}
}
