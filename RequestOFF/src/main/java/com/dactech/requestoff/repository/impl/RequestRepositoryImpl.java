package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.model.request.RequestDetailsRequest;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.repository.custom.RequestRepositoryCustom;

public class RequestRepositoryImpl implements RequestRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;

	@Override
	public List<Request> searchRequest(RequestSearchRequest requestSearchRequest) {
		StringBuilder queryString = new StringBuilder("SELECT * FROM request ");
		StringBuilder whereClause = new StringBuilder("");

		if (requestSearchRequest.getId() != 0) {
			whereClause.append(" AND id = '" + requestSearchRequest.getId() + "'");
		}

		if (requestSearchRequest.getEmployeeId() != 0) {
			whereClause.append(" AND employee_id = '" + requestSearchRequest.getEmployeeId() + "'");
		}

		if (requestSearchRequest.getReason() != null && requestSearchRequest.getReason() != "") {
			whereClause.append(" AND reason like '%" + requestSearchRequest.getReason() + "%'");
		}

		if (requestSearchRequest.getStatus() != 0) {
			whereClause.append(" AND status = '" + requestSearchRequest.getStatus() + "'");
		}

		if (requestSearchRequest.getResponseMessage() != null && requestSearchRequest.getResponseMessage() != "") {
			whereClause.append(" AND response_message like '%" + requestSearchRequest.getResponseMessage() + "%'");
		}

		if (requestSearchRequest.getDayOffTypeId() != 0) {
			whereClause.append(" AND day_off_type_id = '" + requestSearchRequest.getDayOffTypeId() + "'");
		}

		if (requestSearchRequest.getRecipientId() != 0) {
			whereClause.append(" AND recipient_id = '" + requestSearchRequest.getRecipientId() + "'");
		}

		if (requestSearchRequest.getFromTime() != null && requestSearchRequest.getFromTime() != "") {
			whereClause.append(" AND to_time >= '" + requestSearchRequest.getFromTime() + "'");
		}

		if (requestSearchRequest.getToTime() != null && requestSearchRequest.getToTime() != "") {
			whereClause.append(" AND from_time <= '" + requestSearchRequest.getToTime() + "'");
		}

		if (requestSearchRequest.getValidFlag() != 0) {
			whereClause.append(" AND valid_flag = '" + requestSearchRequest.getValidFlag() + "'");
		}

		if (whereClause.length() > 0) {
			whereClause.replace(0, 5, " WHERE ");
			queryString.append(whereClause);
		}
		Query query = entityManager.createNativeQuery(queryString.toString(), Request.class);
		List<Request> requests = query.getResultList();
		return requests;
	}

}
