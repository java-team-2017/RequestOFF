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
		StringBuilder queryString = new StringBuilder("SELECT * FROM employee e INNER JOIN position p ON e.position_id = p.id ");
		StringBuilder joinClause = new StringBuilder(" INNER JOIN team_employee te ON e.id = te.employee_id INNER JOIN team t ON te.team_id = t.id ");
		StringBuilder whereClause = new StringBuilder("");
		
		StringBuilder inClause = new StringBuilder("");
		
		if (StringUtil.isNotEmpty(employeeSearchRequest.getTeamDeptFlag()) && employeeSearchRequest.getTeamDeptFlag().equals("1")) {
			if (StringUtil.isNotEmpty(employeeSearchRequest.getTeamId())) { // team param not null
				inClause.append(" ( e.id IN (SELECT leader_id FROM team where id = " + employeeSearchRequest.getTeamId() + ") OR "
						+ " e.id IN (SELECT employee_id FROM team_employee where team_id = " + employeeSearchRequest.getTeamId() + " ) ");
				if (StringUtil.isNotEmpty(employeeSearchRequest.getDepartmentId())) { // department not null
					inClause.append(" OR e.id IN (SELECT manager_id FROM department where id = " + employeeSearchRequest.getDepartmentId() + ") ");
				} else { // department null
				}
				
			} else { // team param null
				if (StringUtil.isNotEmpty(employeeSearchRequest.getDepartmentId())) { // department not null
					inClause.append(" ( e.id IN (SELECT leader_id FROM team where department_id = " + employeeSearchRequest.getDepartmentId() + ") OR "
							+ " e.id IN (SELECT employee_id FROM team_employee te INNER JOIN team t ON te.team_id = t.id WHERE t.department_id = " + employeeSearchRequest.getDepartmentId() + ") OR "
							+ " e.id IN (SELECT manager_id FROM department where id = " + employeeSearchRequest.getDepartmentId() + ")");
				} else { // department null
					inClause.append(" ( e.id IN (SELECT leader_id FROM team) OR "
							+ " e.id IN (SELECT employee_id FROM team_employee te INNER JOIN team t ON te.team_id = t.id) OR "
							+ " e.id IN (SELECT manager_id FROM department) ");
				}
			}
			inClause.append(" )");
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
		
		if(StringUtil.isNotEmpty(employeeSearchRequest.getPositionCode())) {
			whereClause.append(" AND p.code = '" + employeeSearchRequest.getPositionCode() + "'");
		}
		
		if(StringUtil.isNotEmpty(employeeSearchRequest.getPositionId())) {
			whereClause.append(" AND p.id = '" + employeeSearchRequest.getPositionId() + "'");
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
		
		if (inClause.length() > 0) {
			queryString.append(" WHERE ");
			queryString.append(inClause.toString());
			queryString.append(whereClause.toString());
		} else {
			if (whereClause.length() > 0) {
				whereClause.replace(0, 5, " WHERE ");
				queryString.append(whereClause.toString());
			}
		}
		
		System.out.println(queryString.toString());
		
		query = entityManager.createNativeQuery(queryString.toString(), Employee.class);
		List<Employee> employees = query.getResultList();
		return employees;
	}

}
