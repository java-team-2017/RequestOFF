package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.model.response.RequestSearchResponse;
import com.dactech.requestoff.repository.RequestRepository;
import com.dactech.requestoff.service.RequestService;

@Service
public class RequestServiceImpl implements RequestService{
	@Autowired
	RequestRepository requestRepository;

	@Override
	public RequestSearchResponse requestSearch(RequestSearchRequest requestSearchRequest) {
		List<Request> requests = requestRepository.searchRequest(requestSearchRequest);
		return new RequestSearchResponse(requests);
	}

}
