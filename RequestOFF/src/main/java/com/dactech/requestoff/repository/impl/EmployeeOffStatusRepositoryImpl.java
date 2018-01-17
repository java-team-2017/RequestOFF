package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.EmployeeOffStatus;
import com.dactech.requestoff.model.request.EmployeeOffStatusDetailsRequest;
import com.dactech.requestoff.repository.custom.EmployeeOffStatusRepositoryCustom;

public class EmployeeOffStatusRepositoryImpl implements EmployeeOffStatusRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public EmployeeOffStatus details(EmployeeOffStatusDetailsRequest employeeOffStatusDetailsRequest) {
		String sqlQuery = "SELECT * FROM employee_off_status WHERE year_id = " + employeeOffStatusDetailsRequest.getYearId() + " AND employee_id = "
							+ employeeOffStatusDetailsRequest.getEmployeeId();
		Query query = entityManager.createNativeQuery(sqlQuery, EmployeeOffStatus.class);
		List<EmployeeOffStatus> listEmployeeOffStatus = query.getResultList();
		
		if(listEmployeeOffStatus.size() > 0) {
			return listEmployeeOffStatus.get(0);
		}
		else {
			return new EmployeeOffStatus();
		}
	}
}
