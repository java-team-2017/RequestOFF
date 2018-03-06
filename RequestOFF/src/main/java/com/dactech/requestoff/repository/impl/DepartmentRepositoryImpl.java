package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.request.DepartmentSearchRequest;
import com.dactech.requestoff.repository.custom.DepartmentRepositoryCustom;
import com.dactech.requestoff.util.StringUtil;

public class DepartmentRepositoryImpl implements DepartmentRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Department> search(DepartmentSearchRequest departmentSearchRequest) {
		String sqlQuery = "SELECT * FROM department d ";
		String sqlJoinQuery = " INNER JOIN employee e ON d.manager_id=e.id ";
		if(StringUtil.isNotEmpty(departmentSearchRequest.getId())) {
			sqlQuery += " AND id = " + departmentSearchRequest.getId();
		}
		
		if(StringUtil.isNotEmpty(departmentSearchRequest.getNameOfEmployee())) {
			sqlQuery += sqlJoinQuery + " AND e.name like '%" + departmentSearchRequest.getNameOfEmployee() + "%'";
		}
		
		if(StringUtil.isNotEmpty(departmentSearchRequest.getName())) {
			if(StringUtil.isNotEmpty(departmentSearchRequest.getNameMatchStatus()) 
					&& departmentSearchRequest.getNameMatchStatus().equals("1")) {
				sqlQuery += " AND name = '" + departmentSearchRequest.getName() + "'";
			}
			else {
				sqlQuery += " AND name like '%" + departmentSearchRequest.getName() + "%'";
			}
		}
		
		if(StringUtil.isNotEmpty(departmentSearchRequest.getManagerId())) {
			sqlQuery += " AND manager_id = " + departmentSearchRequest.getManagerId();
		}
		if(StringUtil.isNotEmpty(departmentSearchRequest.getValidFlag())) {
			sqlQuery += " AND valid_flag = " + departmentSearchRequest.getValidFlag();
		}
		
		if(sqlQuery.indexOf("AND") >= 0) {
			sqlQuery = sqlQuery.replaceFirst("AND", "WHERE");
		}
		
		Query query = entityManager.createNativeQuery(sqlQuery, Department.class);
		
		List<Department> listDepartment = query.getResultList();
		return listDepartment;
	}
}
