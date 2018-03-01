package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.Role;
import com.dactech.requestoff.model.request.RoleSearchRequest;
import com.dactech.requestoff.repository.custom.RoleRepositoryCustom;
import com.dactech.requestoff.util.StringUtil;

public class RoleRepositoryImpl implements RoleRepositoryCustom{
	@PersistenceContext
	EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Role> search(RoleSearchRequest roleSearchRequest) {
		String sqlQuery = "SELECT * FROM role";
		if(StringUtil.isNotEmpty(roleSearchRequest.getId())) {
			sqlQuery += " AND id = " + roleSearchRequest.getId();
		}
		if(StringUtil.isNotEmpty(roleSearchRequest.getRole())) {
			sqlQuery += " AND role = " + roleSearchRequest.getRole();
		}
		if(StringUtil.isNotEmpty(roleSearchRequest.getValidFlag())) {
			sqlQuery += " AND valid_flag = " + roleSearchRequest.getValidFlag();
		}
		
		if(sqlQuery.indexOf("AND") >= 0) {
			sqlQuery = sqlQuery.replaceFirst("AND", "WHERE");
		}
		
		Query query = entityManager.createNativeQuery(sqlQuery, Role.class);
		
		List<Role> listRole = query.getResultList();
		return listRole;
	}
}
