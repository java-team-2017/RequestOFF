package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.Team;
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
		StringBuilder sqlJoinQuery = new StringBuilder(
				"SELECT * FROM employee INNER JOIN team_employee ON employee.id = team_employee.employee_id INNER JOIN team ON team_employee.team_id = team.id ");
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

	@Override
	public List<Employee> search(String name, long teamId, long departmentId) {
		StringBuilder queryString = new StringBuilder(
				"SELECT * " + "FROM employee e INNER JOIN team_employee te ON te.employee_id = e.id"
						+ " INNER JOIN team t ON te.team_id = t.id ");
		StringBuilder whereClause = new StringBuilder("");

		if (name != null && name != "") {
			whereClause.append(" AND e.name like '%" + name + "%'");
		}

		if (teamId != 0) {
			whereClause.append(" AND t.id = '" + teamId + "'");
		}

		if (departmentId != 0) {
			whereClause.append(" AND t.department_id = '" + departmentId + "'");
		}
		
		whereClause.append(" AND e.valid_flag = '" + 1 + "'");

		if (whereClause.length() > 0) {
			whereClause.replace(0, 5, " WHERE ");
			queryString.append(whereClause);
		}

		Query query = entityManager.createNativeQuery(queryString.toString(), Employee.class);
		List<Employee> employees = query.getResultList(); // list employees without manager
		
		
		if (teamId == 0) { // team ID == 0, select manager
			StringBuilder managerQueryString = new StringBuilder("SELECT * FROM employee e INNER JOIN department d ON e.id = d.manager_id ");
			if( departmentId != 0) { // select 1 manager
				managerQueryString.append("WHERE d.id = " + departmentId);
			}
			
			query = entityManager.createNativeQuery(managerQueryString.toString(), Employee.class);
			List<Employee> managers = query.getResultList(); // list employees without manager
			if (managers != null && managers.size() > 0) {
				employees.addAll(managers);
			}
		}
		
		return employees;
	}

}
