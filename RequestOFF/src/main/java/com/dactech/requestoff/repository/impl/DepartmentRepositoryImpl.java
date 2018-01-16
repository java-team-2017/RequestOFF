package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.request.DepartmentSearchRequest;
import com.dactech.requestoff.repository.custom.DepartmentRepositoryCustom;

public class DepartmentRepositoryImpl implements DepartmentRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Department> search(DepartmentSearchRequest departmentSearchRequest) {
		String sqlQuery = "SELECT * FROM department";
		if(departmentSearchRequest.getId() != 0) {
			sqlQuery += " AND id = " + departmentSearchRequest.getId() + "";
		}
		if(departmentSearchRequest.getName() != "") {
			if(departmentSearchRequest.getNameMatchStatus() == 0) {
				sqlQuery += " AND name like '%" + departmentSearchRequest.getName() + "%'";
			}
			else {
				sqlQuery += " AND name = '" + departmentSearchRequest.getName() + "'";
			}
		}
		if(departmentSearchRequest.getManagerId() != 0) {
			sqlQuery += " AND manager_id = " + departmentSearchRequest.getManagerId() + "";
		}
		if(departmentSearchRequest.getValidFlag() != -1) {
			sqlQuery += " AND valid_flag = " + departmentSearchRequest.getValidFlag() + "";
		}
		
		if(sqlQuery.indexOf("AND") >= 0) {
			sqlQuery = sqlQuery.replaceFirst("AND", "WHERE");
		}
		
		Query query = entityManager.createNativeQuery(sqlQuery, Department.class);
		
		List<Department> listDepartment = query.getResultList();
		return listDepartment;
	}
}
