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
		Query query = null;
		StringBuilder queryString = new StringBuilder("SELECT * FROM employee e ");
		StringBuilder joinClause = new StringBuilder(" INNER JOIN team_employee te ON e.id = te.employee_id INNER JOIN team t ON te.team_id = t.id ");
		StringBuilder whereClause = new StringBuilder("");
		
		if (StringUtil.isNotEmpty(employeeSearchRequest.getTeamId())) {
			whereClause.append(" AND te.team_id = " + employeeSearchRequest.getTeamId());
		}
		
		if (StringUtil.isNotEmpty(employeeSearchRequest.getDepartmentId())) {
			whereClause.append(" AND t.department_id = " + employeeSearchRequest.getDepartmentId());
		}
		
		if (whereClause.length() > 0) {
			queryString.append(joinClause.toString());
		}
		
		if(StringUtil.isNotEmpty(employeeSearchRequest.getId())) {
			whereClause.append(" AND id = " + employeeSearchRequest.getId());
		}
		
		if(StringUtil.isNotEmpty(employeeSearchRequest.getName())) {
			if(StringUtil.isNotEmpty(employeeSearchRequest.getNameMatchStatus()) && employeeSearchRequest.getNameMatchStatus().equals("1")) {
				whereClause.append(" AND e.name = '" + employeeSearchRequest.getName() + "'");
			} else {
				whereClause.append(" AND e.name like '%" + employeeSearchRequest.getName() + "%'");
			}
		}
		
		if(StringUtil.isNotEmpty(employeeSearchRequest.getGender())) {
			whereClause.append(" AND gender = '" + employeeSearchRequest.getGender() + "'");
		}
		
		if(StringUtil.isNotEmpty(employeeSearchRequest.getBirthday())) {
			whereClause.append(" AND birthday = '" + employeeSearchRequest.getBirthday() + "'");
		}
		
		if(StringUtil.isNotEmpty(employeeSearchRequest.getPositionId())) {
			whereClause.append(" AND position_id = '" + employeeSearchRequest.getPositionId() + "'");
		}
		
		if(StringUtil.isNotEmpty(employeeSearchRequest.getEmail())) {
			whereClause.append(" AND email = '" + employeeSearchRequest.getEmail() + "'");
		}
		
		if(StringUtil.isNotEmpty(employeeSearchRequest.getPhone())) {
			whereClause.append(" AND phone = '" + employeeSearchRequest.getPhone() + "'");
		}
		
		if(StringUtil.isNotEmpty(employeeSearchRequest.getStartWorkingDate())) {
			whereClause.append(" AND start_working_date = '" + employeeSearchRequest.getStartWorkingDate() + "'");
		}
		
		if(StringUtil.isNotEmpty(employeeSearchRequest.getOfficalWorkingDate())) {
			whereClause.append(" AND offical_working_date = '" + employeeSearchRequest.getOfficalWorkingDate() + "'");
		}
		
		if(StringUtil.isNotEmpty(employeeSearchRequest.getValidFlag())) {
			whereClause.append(" AND e.valid_flag = '" + employeeSearchRequest.getValidFlag() + "'");
		}
		
		if (whereClause.length() > 0) {
			whereClause.replace(0, 5, " WHERE ");
			queryString.append(whereClause.toString());
		}
		query = entityManager.createNativeQuery(queryString.toString(), Employee.class);
		List<Employee> employees = query.getResultList();
		return employees;
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
