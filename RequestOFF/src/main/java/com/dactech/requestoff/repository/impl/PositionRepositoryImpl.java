package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.Position;
import com.dactech.requestoff.model.request.PositionSearchRequest;
import com.dactech.requestoff.repository.custom.PositionRepositoryCustom;
import com.dactech.requestoff.util.StringUtil;

public class PositionRepositoryImpl implements PositionRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public List<Position> search(PositionSearchRequest positionSearchRequest) {
		boolean whereClause = true;
		StringBuilder sqlQuery = new StringBuilder("SELECT * FROM position ");

		if (StringUtil.isNotEmpty(positionSearchRequest.getId())) {
			sqlQuery.append(" WHERE id = '" + positionSearchRequest.getId() + "'");
			whereClause = false;
		}

		if (StringUtil.isNotEmpty(positionSearchRequest.getName())) {
			if (StringUtil.isNotEmpty(positionSearchRequest.getNameMatchStatus())) {
				String sqlString = whereClause ? " WHERE " : " AND ";
				sqlQuery.append(sqlString + " name like '%" + positionSearchRequest.getName() + "%'");
				whereClause = false;
			} else {
				String sqlString = whereClause ? " WHERE " : " AND ";
				sqlQuery.append(sqlString + " name = '" + positionSearchRequest.getName() + "'");
				whereClause = false;
			}

		}

		if (StringUtil.isNotEmpty(positionSearchRequest.getValidFlag())) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + " valid_flag = '" + positionSearchRequest.getValidFlag() + "'");
			whereClause = false;
		}
		
		if (StringUtil.isNotEmpty(positionSearchRequest.getCode())) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + " code = '" + positionSearchRequest.getCode() + "'");
			whereClause = false;
		}

		Query query = entityManager.createNativeQuery(sqlQuery.toString(), Position.class);
		return query.getResultList();
	}

}
