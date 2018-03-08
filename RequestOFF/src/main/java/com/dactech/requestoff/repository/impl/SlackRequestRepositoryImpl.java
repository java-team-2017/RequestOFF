package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.SlackRequest;
import com.dactech.requestoff.model.request.SlackRequestSearchRequest;
import com.dactech.requestoff.repository.custom.SlackRequestRepositoryCustom;
import com.dactech.requestoff.util.StringUtil;

public class SlackRequestRepositoryImpl implements SlackRequestRepositoryCustom{
	@PersistenceContext
	EntityManager entityManager;
	@Override
	public List<SlackRequest> search(SlackRequestSearchRequest request) {
		StringBuilder queryString = new StringBuilder("SELECT * FROM slack_request ");
		StringBuilder whereClause = new StringBuilder("");
		if (StringUtil.isNotEmpty(request.getMsgTimeFrom())) {
			whereClause.append(" AND msg_time >= " + request.getMsgTimeFrom());
		}
		if (StringUtil.isNotEmpty(request.getMsgTimeTo())) {
			whereClause.append(" AND msg_time <= " + request.getMsgTimeTo());
		}
		if (StringUtil.isNotEmpty(request.getIsValidMsg())) {
			whereClause.append(" AND is_valid_msg = " + request.getIsValidMsg());
		}
		if (StringUtil.isNotEmpty(request.getProcessFlag())) {
			whereClause.append(" AND process_flag = " + request.getProcessFlag());
		}
		if (whereClause.length() > 0) {
			whereClause.replace(0, 5, " WHERE ");
			queryString.append(whereClause);
		} 
		Query query = entityManager.createNativeQuery(queryString.toString(), SlackRequest.class);
		@SuppressWarnings("unchecked")
		List<SlackRequest> slackRequests = query.getResultList();
		return slackRequests;
	}

}
