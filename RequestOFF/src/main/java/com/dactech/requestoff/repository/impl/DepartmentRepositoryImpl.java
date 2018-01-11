package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.repository.custom.DepartmentRepositoryCustom;

public class DepartmentRepositoryImpl implements DepartmentRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Department> search(long id, String name, long managerId, int validFlag) {
		String sqlQuery = "SELECT * FROM department";
		if(id != 0) {
			sqlQuery += " AND id = " + id + "";
		}
		if(name != "") {
			sqlQuery += " AND name like '%" + name + "%'";
		}
		if(managerId != 0) {
			sqlQuery += " AND manager_id = " + managerId + "";
		}
		if(validFlag != -1) {
			sqlQuery += " AND valid_flag = " + validFlag + "";
		}
		
		if(sqlQuery.indexOf("AND") >= 0) {
			sqlQuery = sqlQuery.replaceFirst("AND", "WHERE");
		}
		
		Query query = entityManager.createNativeQuery(sqlQuery, Department.class);
		
		List<Department> listDepartment = query.getResultList();
		return listDepartment;
	}
}
