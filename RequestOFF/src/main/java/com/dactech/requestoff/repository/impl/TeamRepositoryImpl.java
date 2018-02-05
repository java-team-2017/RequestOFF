package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.Team;
import com.dactech.requestoff.model.request.TeamSearchRequest;
import com.dactech.requestoff.repository.custom.TeamRepositoryCustom;
import com.dactech.requestoff.util.StringUtil;

public class TeamRepositoryImpl implements TeamRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public List<Team> searchTeam(TeamSearchRequest teamSearchRequest) {
		StringBuilder queryString = new StringBuilder("SELECT * FROM team ");
		StringBuilder whereClause = new StringBuilder("");

		if (StringUtil.isNotEmpty(teamSearchRequest.getId())) {
			whereClause.append(" AND id = '" + teamSearchRequest.getId() + "'");
		}

		if (StringUtil.isNotEmpty(teamSearchRequest.getName())) {
			if (StringUtil.isNotEmpty(teamSearchRequest.getNameMatchStatus()) && teamSearchRequest.getNameMatchStatus().equals("1")) {
				whereClause.append(" AND name = '" + teamSearchRequest.getName() + "'");
			} else {
				whereClause.append(" AND name like '%" + teamSearchRequest.getName() + "%'");
			}
		}

		if (StringUtil.isNotEmpty(teamSearchRequest.getLeaderId())) {
			whereClause.append(" AND leader_id = '" + teamSearchRequest.getLeaderId() + "'");
		}

		if (StringUtil.isNotEmpty(teamSearchRequest.getDepartmentId())) {
			whereClause.append(" AND department_id = '" + teamSearchRequest.getDepartmentId() + "'");
		}
		
		if (StringUtil.isNotEmpty(teamSearchRequest.getValidFlag())) {
			whereClause.append(" AND valid_flag = '" + teamSearchRequest.getValidFlag() + "'");
		}
		
		if (whereClause.length() > 0) {
			whereClause.replace(0, 5, " WHERE ");
			queryString.append(whereClause);
		}

		Query query = entityManager.createNativeQuery(queryString.toString(), Team.class);
		List<Team> teams = query.getResultList();
		return teams;
	}
}
