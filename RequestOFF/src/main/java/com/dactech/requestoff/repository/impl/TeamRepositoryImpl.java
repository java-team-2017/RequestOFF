package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.Team;
import com.dactech.requestoff.model.request.TeamSearchRequest;
import com.dactech.requestoff.repository.custom.TeamRepositoryCustom;

public class TeamRepositoryImpl implements TeamRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;

	@Override
	public List<Team> searchTeam(TeamSearchRequest teamSearchRequest) {
		StringBuilder queryString = new StringBuilder("SELECT * FROM team ");
		StringBuilder whereClause = new StringBuilder("");

		if (teamSearchRequest.getId() != 0) {
			whereClause.append(" AND id = '" + teamSearchRequest.getId() + "'");
		}

		if (teamSearchRequest.getName() != null && teamSearchRequest.getName() != "") {
			if (teamSearchRequest.getNameMatchStatus() != 1) {
				whereClause.append(" AND name like '%" + teamSearchRequest.getName() + "%'");
			} else {
				whereClause.append(" AND name = '" + teamSearchRequest.getName() + "'");
			}
		}

		if (teamSearchRequest.getLeaderId() != 0) {
			whereClause.append(" AND leader_id = '" + teamSearchRequest.getLeaderId() + "'");
		}

		if (teamSearchRequest.getDepartmentId() != 0) {
			whereClause.append(" AND department_id = '" + teamSearchRequest.getDepartmentId() + "'");
		}

		whereClause.append(" AND valid_flag = '" + teamSearchRequest.getValidFlag() + "'");

		if (whereClause.length() > 0) {
			whereClause.replace(0, 5, " WHERE ");
			queryString.append(whereClause);
		}

		Query query = entityManager.createNativeQuery(queryString.toString(), Team.class);
		List<Team> teams = query.getResultList();
		return teams;
	}
}
