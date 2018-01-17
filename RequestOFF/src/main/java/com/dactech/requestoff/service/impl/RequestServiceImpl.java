package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.DayOffType;
import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.model.request.RequestDetailRequest;
import com.dactech.requestoff.model.request.RequestRegistRequest;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.model.response.RequestDetailResponse;
import com.dactech.requestoff.model.response.RequestRegistResponse;
import com.dactech.requestoff.model.response.RequestSearchResponse;
import com.dactech.requestoff.repository.RequestRepository;
import com.dactech.requestoff.service.RequestService;

@Service
public class RequestServiceImpl implements RequestService{
	@Autowired
	RequestRepository requestRepository;
	
	@Override
	public RequestRegistResponse regist(RequestRegistRequest requestRegistRequest) {
		Request request = requestRepository.findById(requestRegistRequest.getId());
		
		if(request == null) {
			request = new Request();
		}
		
		Employee employee = new Employee();
		employee.setId(requestRegistRequest.getEmployeeId());
		request.setEmployee(employee);
		
		request.setFromTime(requestRegistRequest.getFromTime());
		request.setToTime(requestRegistRequest.getToTime());
		request.setReason(requestRegistRequest.getReason());
		request.setStatus(requestRegistRequest.getStatus());
		request.setResponseMessage(requestRegistRequest.getResponseMessage());
		
		DayOffType dayOffType = new DayOffType();
		dayOffType.setId(requestRegistRequest.getDayOffTypeId());
		request.setDayOffType(dayOffType);
		
		request.setRecipientId(requestRegistRequest.getRecipientId());
		request.setValidFlag(requestRegistRequest.getValidFlag());
		
		requestRepository.save(request);
		
		RequestRegistResponse requestRegistResponse = new RequestRegistResponse(request.getId());	
		return requestRegistResponse;
	}

	@Override
	public RequestSearchResponse requestSearch(RequestSearchRequest requestSearchRequest) {
		List<Request> requests = requestRepository.searchRequest(requestSearchRequest);
		return new RequestSearchResponse(requests);
	}

	@Override
	public RequestDetailResponse detail(RequestDetailRequest requestDetailRequest) {
		Request request = requestRepository.detail(requestDetailRequest);
		RequestDetailResponse requestDetailResponse = new RequestDetailResponse(request);
		return requestDetailResponse;
	}
}
