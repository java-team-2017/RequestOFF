package com.dactech.requestoff.repository.custom;

import java.util.List;

import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.model.request.RequestDetailRequest;
import com.dactech.requestoff.model.request.RequestSearchRequest;

public interface RequestRepositoryCustom {
	public List<Request> searchRequest(RequestSearchRequest requestSearchRequest);
	
	public Request detail(RequestDetailRequest requestDetailRequest);
}
