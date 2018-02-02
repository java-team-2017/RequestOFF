package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.request.EmployeeSearchRequest;
import com.dactech.requestoff.repository.custom.EmployeeRepositoryCustom;
import com.dactech.requestoff.util.StringUtil;

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

		if (StringUtil.isNotEmpty(employeeSearchRequest.getId())) {
			sqlQuery.append(" WHERE employee.id = '" + employeeSearchRequest.getId() + "'");
			whereClause = false;
		}

		if (StringUtil.isNotEmpty(employeeSearchRequest.getName())) {
			if (StringUtil.isNotEmpty(employeeSearchRequest.getNameMatchStatus())) {
				String sqlString = whereClause ? " WHERE " : " AND ";
				sqlQuery.append(sqlString + "name like '%" + employeeSearchRequest.getName() + "%'");
				whereClause = false;
			} else {
				String sqlString = whereClause ? " WHERE " : " AND ";
				sqlQuery.append(sqlString + "name = '" + employeeSearchRequest.getName() + "'");
				whereClause = false;
			}
		}

		if (StringUtil.isNotEmpty(employeeSearchRequest.getGender())) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + "gender = '" + employeeSearchRequest.getGender() + "'");
			whereClause = false;
		}

		if (StringUtil.isNotEmpty(employeeSearchRequest.getBirthday())) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + "birthday = '" + employeeSearchRequest.getBirthday() + "'");
			whereClause = false;
		}

		if (StringUtil.isNotEmpty(employeeSearchRequest.getPositionId())) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + "position_id = '" + employeeSearchRequest.getPositionId() + "'");
			whereClause = false;
		}

		if (StringUtil.isNotEmpty(employeeSearchRequest.getEmail())) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + "email = '" + employeeSearchRequest.getEmail() + "'");
			whereClause = false;
		}

		if (StringUtil.isNotEmpty(employeeSearchRequest.getPhone())) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + "phone = '" + employeeSearchRequest.getPhone() + "'");
			whereClause = false;
		}

		if (StringUtil.isNotEmpty(employeeSearchRequest.getStartWorkingDate())) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + "start_working_date = '" + employeeSearchRequest.getStartWorkingDate() + "'");
			whereClause = false;
		}

		if (StringUtil.isNotEmpty(employeeSearchRequest.getOfficalWorkingDate())) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(
					sqlString + "offical_working_date = '" + employeeSearchRequest.getOfficalWorkingDate() + "'");
			whereClause = false;
		}

		if (StringUtil.isNotEmpty(employeeSearchRequest.getValidFlag())) {
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> search(String name, String teamId, String departmentId) {
		StringBuilder queryString = new StringBuilder(
				"SELECT * " + "FROM employee e INNER JOIN team_employee te ON te.employee_id = e.id"
						+ " INNER JOIN team t ON te.team_id = t.id ");
		StringBuilder whereClause = new StringBuilder("");

		if (StringUtil.isNotEmpty(name)) {
			whereClause.append(" AND e.name like '%" + name + "%'");
		}

		if (StringUtil.isNotEmpty(teamId)) {
			whereClause.append(" AND t.id = '" + teamId + "'");
		}

		if (StringUtil.isNotEmpty(departmentId)) {
			whereClause.append(" AND t.department_id = '" + departmentId + "'");
		}

		whereClause.append(" AND e.valid_flag = '1' AND te.valid_flag = '1' AND t.valid_flag = '1' ");

		if (whereClause.length() > 0) {
			whereClause.replace(0, 5, " WHERE ");
			queryString.append(whereClause);
		}

		Query query = entityManager.createNativeQuery(queryString.toString(), Employee.class);
		List<Employee> employees = query.getResultList(); // list employees without manager

		if (StringUtil.isEmpty(teamId)) { // if team ID is empty== 0, select manager
			StringBuilder managerQueryString = new StringBuilder(
					"SELECT * FROM employee e INNER JOIN department d ON e.id = d.manager_id "
							+ "WHERE e.valid_flag = '1' AND d.valid_flag = '1' ");
			if (StringUtil.isNotEmpty(departmentId)) { // select 1 manager
				managerQueryString.append("AND d.id = " + departmentId + " ");
			}
			if (StringUtil.isNotEmpty(name)) {
				managerQueryString.append(" AND e.name like '%" + name + "%'");
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
