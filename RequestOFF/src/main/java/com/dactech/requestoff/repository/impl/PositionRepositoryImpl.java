package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.Position;
import com.dactech.requestoff.model.request.PositionSearchRequest;
import com.dactech.requestoff.repository.custom.PositionRepositoryCustom;

public class PositionRepositoryImpl implements PositionRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public List<Position> search(PositionSearchRequest positionSearchRequest) {
		boolean whereClause = true;
		StringBuilder sqlQuery = new StringBuilder("SELECT * FROM position ");

		if (positionSearchRequest.getId() != 0) {
			sqlQuery.append(" WHERE id = '" + positionSearchRequest.getId() + "'");
			whereClause = false;
		}

		if (positionSearchRequest.getName() != null && positionSearchRequest.getName() != "") {
			if (positionSearchRequest.getNameMatchStatus() != 1) {
				String sqlString = whereClause ? " WHERE " : " AND ";
				sqlQuery.append(sqlString + " name like '%" + positionSearchRequest.getName() + "%'");
				whereClause = false;
			} else {
				String sqlString = whereClause ? " WHERE " : " AND ";
				sqlQuery.append(sqlString + " name = '" + positionSearchRequest.getName() + "'");
				whereClause = false;
			}

		}

		if (positionSearchRequest.getValidFlag() == 0 || positionSearchRequest.getValidFlag() == 1) {
			String sqlString = whereClause ? " WHERE " : " AND ";
			sqlQuery.append(sqlString + " valid_flag = '" + positionSearchRequest.getValidFlag() + "'");
			whereClause = false;
		}

		Query query = entityManager.createNativeQuery(sqlQuery.toString(), Position.class);
		return query.getResultList();
	}

}
