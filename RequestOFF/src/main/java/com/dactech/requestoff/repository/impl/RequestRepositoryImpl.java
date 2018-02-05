package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.repository.custom.RequestRepositoryCustom;
import com.dactech.requestoff.util.StringUtil;

public class RequestRepositoryImpl implements RequestRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;

	@Override
	public List<Request> searchRequest(RequestSearchRequest requestSearchRequest) {
		StringBuilder queryString = new StringBuilder("SELECT * FROM request INNER JOIN employee ON request.employee_id = employee.id ");
		StringBuilder whereClause = new StringBuilder("");
		
		if (StringUtil.isNotEmpty(requestSearchRequest.getNameOfEmployee())) {
			whereClause.append(" AND name like '%" + requestSearchRequest.getNameOfEmployee() + "%'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getId())) {
			whereClause.append(" AND request.id = '" + requestSearchRequest.getId() + "'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getEmployeeId())) {
			whereClause.append(" AND request.employee_id = '" + requestSearchRequest.getEmployeeId() + "'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getReason())) {
			whereClause.append(" AND request.reason like '%" + requestSearchRequest.getReason() + "%'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getStatus())) {
			whereClause.append(" AND request.status = '" + requestSearchRequest.getStatus() + "'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getResponseMessage())) {
			whereClause.append(" AND request.response_message like '%" + requestSearchRequest.getResponseMessage() + "%'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getDayOffTypeId())) {
			whereClause.append(" AND request.day_off_type_id = '" + requestSearchRequest.getDayOffTypeId() + "'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getRecipientId())) {
			whereClause.append(" AND request.recipient_id = '" + requestSearchRequest.getRecipientId() + "'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getFromTime())) {
			whereClause.append(" AND to_time >= '" + requestSearchRequest.getFromTime() + "'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getToTime())) {
			whereClause.append(" AND from_time <= '" + requestSearchRequest.getToTime() + "'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getValidFlag())) {
			whereClause.append(" AND valid_flag = '" + requestSearchRequest.getValidFlag() + "'");
		}

		if (whereClause.length() > 0) {
			whereClause.replace(0, 5, " WHERE ");
			queryString.append(whereClause);
		} 
		Query query = entityManager.createNativeQuery(queryString.toString(), Request.class);
		@SuppressWarnings("unchecked")
		List<Request> requests = query.getResultList();
		return requests;
	}

}
