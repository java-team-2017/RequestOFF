package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.request.EmployeeSearchRequest;
import com.dactech.requestoff.repository.custom.EmployeeRepositoryCustom;

public class EmployeeRepositoryImpl implements EmployeeRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> search(EmployeeSearchRequest employeeSearchRequest) {
		boolean whereClause = true;
		Query query = null;
		StringBuilder sqlJoinQuery = new StringBuilder("SELECT * FROM employee INNER JOIN team_employee ON employee.id = team_employee.employee_id INNER JOIN team ON team_employee.team_id = team.id ");
		StringBuilder sqlQuery = new StringBuilder("SELECT * FROM employee ");

		if (employeeSearchRequest.getId() != 0) {
			sqlJoinQuery.append(" WHERE employee.id = '" + employeeSearchRequest.getId() + "'");
			whereClause = false;
		}

		if (employeeSearchRequest.getName() != null && employeeSearchRequest.getName() != "") {
			if (employeeSearchRequest.getNameMatchStatus() != 1) {
				String sqlString = whereClause ? " WHERE " : " AND ";
				sqlQuery.append(sqlString + "name like '%" + employeeSearchRequest.getName() + "%'");
				whereClause = false;
			} else {
				String sqlString = whereClause ? " WHERE " : " AND ";
				sqlQuery.append(sqlString + "name = '" + employeeSearchRequest.getName() + "'");
				whereClause = false;
			}
		}

		if (employeeSearchRequest.getGender() != null && employeeSearchRequest.getGender() != "") {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + "gender = " + employeeSearchRequest.getGender() + "'");
			whereClause = false;
		}

		if (employeeSearchRequest.getBirthday() != null && employeeSearchRequest.getBirthday() != "") {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + "birthday = " + employeeSearchRequest.getBirthday() + "'");
			whereClause = false;
		}

		if (employeeSearchRequest.getPositionId() != 0) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + "position_id = '" + employeeSearchRequest.getPositionId() + "'");
			whereClause = false;
		}

		if (employeeSearchRequest.getEmail() != null && employeeSearchRequest.getEmail() != "") {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + "email = '" + employeeSearchRequest.getEmail() + "'");
			whereClause = false;
		}

		if (employeeSearchRequest.getPhone() != 0) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + "phone = '" + employeeSearchRequest.getPhone() + "'");
			whereClause = false;
		}

		if (employeeSearchRequest.getStartWorkingDate() != null && employeeSearchRequest.getStartWorkingDate() != "") {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + "start_working_date = '" + employeeSearchRequest.getStartWorkingDate() + "'");
			whereClause = false;
		}

		if (employeeSearchRequest.getOfficalWorkingDate() != null
				& employeeSearchRequest.getOfficalWorkingDate() != "") {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(
					sqlString + "offical_working_date = '" + employeeSearchRequest.getOfficalWorkingDate() + "'");
			whereClause = false;
		}

		if (employeeSearchRequest.getValidFlag() == 0 || employeeSearchRequest.getValidFlag() == 1) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + "valid_flag = '" + employeeSearchRequest.getValidFlag() + "'");
			whereClause = false;
		}

		if (sqlQuery.indexOf("WHERE") != -1) {
			query = entityManager.createNativeQuery(sqlQuery.toString(), Employee.class);
		} else {
			query = entityManager.createNativeQuery(sqlJoinQuery.toString(), Employee.class);
		}
		return query.getResultList();
	}

}
