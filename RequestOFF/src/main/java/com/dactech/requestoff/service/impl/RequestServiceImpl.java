package com.dactech.requestoff.service.impl;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.DayOffType;
import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.EmployeeOffStatus;
import com.dactech.requestoff.model.entity.Position;
import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.model.request.RequestBrowsingRequest;
import com.dactech.requestoff.model.request.RequestDetailsRequest;
import com.dactech.requestoff.model.request.RequestRegistRequest;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.model.response.RequestBrowsingResponse;
import com.dactech.requestoff.model.response.RequestDetailsResponse;
import com.dactech.requestoff.model.response.RequestRegistResponse;
import com.dactech.requestoff.model.response.RequestSearchResponse;
import com.dactech.requestoff.repository.EmployeeOffStatusRepository;
import com.dactech.requestoff.repository.EmployeeRepository;
import com.dactech.requestoff.repository.RequestRepository;
import com.dactech.requestoff.service.RequestService;
import com.dactech.requestoff.util.StringUtil;

@Service
public class RequestServiceImpl implements RequestService{
	@Autowired
	RequestRepository requestRepository;
	@Autowired
	EmployeeOffStatusRepository employeeOffStatusRepository;
	@Autowired
	EmployeeRepository employeeRepository;
	
	@Override
	public RequestRegistResponse regist(RequestRegistRequest requestRegistRequest) throws Exception{
		double offHours, newRemainHours;
		long employeeId;
		int currentYear = Calendar.getInstance().get(Calendar.YEAR);
		if(StringUtil.isEmpty(requestRegistRequest.getId())) {	//create new request
			employeeId = Long.parseLong(requestRegistRequest.getEmployeeId());
			double remainHours = employeeOffStatusRepository.findById(currentYear, employeeId).getRemainHours();
			offHours = Double.parseDouble(requestRegistRequest.getTotalTime());
			newRemainHours = remainHours - offHours;
		}
		else {	//update or delete request
			Request request = requestRepository.findById(Long.parseLong(requestRegistRequest.getId()));
			employeeId = request.getEmployee().getId();
			double remainHours = employeeOffStatusRepository.findById(currentYear, employeeId).getRemainHours();
			double oldOffHours = request.getTotalTime();
			int oldStatus = request.getStatus();
			
			if(StringUtil.isNotEmpty(requestRegistRequest.getTotalTime()) && StringUtil.isEmpty(requestRegistRequest.getValidFlag())
					&& StringUtil.isEmpty(requestRegistRequest.getStatus())) {
				offHours = Double.parseDouble(requestRegistRequest.getTotalTime());
				newRemainHours = remainHours + oldOffHours - offHours;
			}
			else if(StringUtil.isEmpty(requestRegistRequest.getTotalTime()) && StringUtil.isNotEmpty(requestRegistRequest.getValidFlag())
					&& StringUtil.isEmpty(requestRegistRequest.getStatus())) {
				if(requestRegistRequest.getValidFlag().equals("0") && request.getValidFlag() == 1
						&& (oldStatus == 1 || oldStatus == 4)) { //delete request
					newRemainHours = remainHours + oldOffHours;
				}
				else {
					newRemainHours = remainHours;
				}
			}
			else if(StringUtil.isEmpty(requestRegistRequest.getTotalTime()) && StringUtil.isEmpty(requestRegistRequest.getValidFlag())
					&& StringUtil.isNotEmpty(requestRegistRequest.getStatus())) {
				if(requestRegistRequest.getStatus().equals("3") && oldStatus != 3) { //deny request
					newRemainHours = remainHours + oldOffHours;
				}
				else {
					newRemainHours = remainHours;
				}
			}
			else if(StringUtil.isNotEmpty(requestRegistRequest.getTotalTime()) && StringUtil.isEmpty(requestRegistRequest.getValidFlag())
					&& StringUtil.isNotEmpty(requestRegistRequest.getStatus())) {
				if(oldStatus == 1 || oldStatus == 4) {
					offHours = Double.parseDouble(requestRegistRequest.getTotalTime());
					newRemainHours = remainHours + oldOffHours - offHours;
				}
				else {
					newRemainHours = remainHours;
				}
			}
			else if(StringUtil.isEmpty(requestRegistRequest.getTotalTime()) && StringUtil.isEmpty(requestRegistRequest.getValidFlag())
					&& StringUtil.isEmpty(requestRegistRequest.getStatus())) {
				newRemainHours = remainHours;
			}
			else {
				throw new Exception("RequestRegistRequest parameter is invalid");
			}
		}
		
		if(newRemainHours < 0) {
			throw new Exception("Hours of off time exceed remain hours");
		}
		
		Request request;
		if(StringUtil.isEmpty(requestRegistRequest.getId())) {	//create new request
			request = new Request();
			
			Employee employee = new Employee();
//			employeeId = Long.parseLong(requestRegistRequest.getEmployeeId());
			employee.setId(employeeId);
			request.setEmployee(employee);
			
			request.setFromTime(requestRegistRequest.getFromTime());
			request.setToTime(requestRegistRequest.getToTime());
			request.setTotalTime(Double.parseDouble(requestRegistRequest.getTotalTime()));
			request.setReason(requestRegistRequest.getReason());
			if(employeeRepository.findById(employeeId).getPosition().getCode() == Position.CODE_MANAGER 
					&& requestRegistRequest.getStatus().equals("5")) {
				request.setStatus(Request.REQUEST_STATUS_APPROVED);
			}
			else {
				request.setStatus(Integer.parseInt(requestRegistRequest.getStatus()));
			}
			request.setResponseMessage(requestRegistRequest.getResponseMessage());
			
			DayOffType dayOffType = new DayOffType();
			dayOffType.setId(Long.parseLong(requestRegistRequest.getDayOffTypeId()));
			request.setDayOffType(dayOffType);
			
			request.setRecipientId(Long.parseLong(requestRegistRequest.getRecipientId()));
			
			request.setValidFlag(Integer.parseInt(requestRegistRequest.getValidFlag()));
		}
		else {	//update request
			long id = Long.parseLong(requestRegistRequest.getId());
			request = requestRepository.findById(id);
			if(request == null) {
				throw new Exception("Can not find request with id = " + id);
			}
			else if(requestRegistRequest.getUpdateDate().equals(request.getUpdateDate()) == false) {
				throw new Exception("Someone updated request with id " + requestRegistRequest.getId() + " at " + request.getUpdateDate());
			}
			else {
				if(StringUtil.isNotEmpty(requestRegistRequest.getFromTime())) {
					request.setFromTime(requestRegistRequest.getFromTime());
				}
				if(StringUtil.isNotEmpty(requestRegistRequest.getToTime())) {
					request.setToTime(requestRegistRequest.getToTime());
				}
				if(StringUtil.isNotEmpty(requestRegistRequest.getTotalTime())) {
					request.setTotalTime(Double.parseDouble(requestRegistRequest.getTotalTime()));
				}
				if(StringUtil.isNotEmpty(requestRegistRequest.getReason())) {
					request.setReason(requestRegistRequest.getReason());
				}
				if(StringUtil.isNotEmpty(requestRegistRequest.getStatus())) {
					if(employeeRepository.findById(employeeId).getPosition().getCode() == Position.CODE_MANAGER 
						&& requestRegistRequest.getStatus().equals("5")) {
						request.setStatus(Request.REQUEST_STATUS_APPROVED);
					}
					else {
						request.setStatus(Integer.parseInt(requestRegistRequest.getStatus()));
					}
				}
				if(StringUtil.isNotEmpty(requestRegistRequest.getResponseMessage())) {
					request.setResponseMessage(requestRegistRequest.getResponseMessage());
				}
				if(StringUtil.isNotEmpty(requestRegistRequest.getDayOffTypeId())) {
					DayOffType dayOffType = new DayOffType();
					dayOffType.setId(Long.parseLong(requestRegistRequest.getDayOffTypeId()));
					request.setDayOffType(dayOffType);
				}
				if(StringUtil.isNotEmpty(requestRegistRequest.getRecipientId())) {
					request.setRecipientId(Long.parseLong(requestRegistRequest.getRecipientId()));
				}
				if(StringUtil.isNotEmpty(requestRegistRequest.getValidFlag())) {
					request.setValidFlag(Integer.parseInt(requestRegistRequest.getValidFlag()));
				}
			}
		}
		
		EmployeeOffStatus employeeOffStatus = employeeOffStatusRepository.findById(currentYear, employeeId);
		System.out.println(newRemainHours);
		employeeOffStatus.setRemainHours(newRemainHours);
		employeeOffStatusRepository.save(employeeOffStatus);
		
		requestRepository.save(request);
		RequestRegistResponse requestRegistResponse = new RequestRegistResponse();
		requestRegistResponse.setId(request.getId());
		return requestRegistResponse;
	}

	@Override
	public RequestSearchResponse requestSearch(RequestSearchRequest requestSearchRequest) {
		if (StringUtil.isNotEmpty(requestSearchRequest.getFromTime())) {
			requestSearchRequest.setFromTime(requestSearchRequest.getFromTime() + " 00:00:00");
		}
		if (StringUtil.isNotEmpty(requestSearchRequest.getToTime())) {
			requestSearchRequest.setToTime(requestSearchRequest.getToTime() + " 23:59:59");
		}
		List<Request> requests = requestRepository.searchRequest(requestSearchRequest);
		
		for(int i = 0; i < requests.size(); i++) {
			Request r = requests.get(i);
			Employee e = employeeRepository.findById(r.getRecipientId());
			if(e != null) {
				String recipientName = e.getName();
				r.setRecipientName(recipientName);
			}
		}
		
		return new RequestSearchResponse(requests);
	}

	@Override
	public RequestDetailsResponse details(RequestDetailsRequest requestDetailsRequest) {
		Request request = requestRepository.findById(Long.parseLong(requestDetailsRequest.getId()));
		RequestDetailsResponse requestDetailsResponse = new RequestDetailsResponse(request);
		return requestDetailsResponse;
	}

	@Override
	public RequestBrowsingResponse requestBrowsing(RequestBrowsingRequest request) {
		List<Request> requests = requestRepository.browseRequest(request);
		RequestBrowsingResponse response = new RequestBrowsingResponse();
		response.setRequests(requests);
		return response;
	}
	
}
