package com.dactech.requestoff.service.impl;

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
import com.dactech.requestoff.repository.DayOffTypeRepository;
import com.dactech.requestoff.repository.EmployeeOffStatusRepository;
import com.dactech.requestoff.repository.EmployeeRepository;
import com.dactech.requestoff.repository.RequestRepository;
import com.dactech.requestoff.service.CompanyYearOffService;
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
	@Autowired
	DayOffTypeRepository dayOffTypeRepository;
	@Autowired
	CompanyYearOffService companyYearOffService;
	
	@Override
	public RequestRegistResponse regist(RequestRegistRequest requestRegistRequest) throws Exception {
		Request request;
//		int currentYear = Calendar.getInstance().get(Calendar.YEAR);
		long currentYear = companyYearOffService.getCurrentYear();
		if(StringUtil.isEmpty(requestRegistRequest.getId())) {	//create new request
			request = new Request();
			Employee employee = employeeRepository.findById(Long.parseLong(requestRegistRequest.getEmployeeId()));
			DayOffType dayOffType = dayOffTypeRepository.findById(Long.parseLong(requestRegistRequest.getDayOffTypeId()));
			
			if(dayOffType.getPaymentFlag() == DayOffType.PAYMENT_FLAG_PAYING) {
				EmployeeOffStatus employeeOffStatus = employeeOffStatusRepository.findById(currentYear, employee.getId());
				double remainHours = employeeOffStatus.getRemainHours();
				double newRemainHours = remainHours - Double.parseDouble(requestRegistRequest.getTotalTime());
				if(newRemainHours >= 0) {
					employeeOffStatus.setRemainHours(newRemainHours);
					employeeOffStatusRepository.save(employeeOffStatus);
				} else {
					throw new Exception("Off hours exceed remain hours");
				}
			}
			
			request.setEmployee(employee);
			
			request.setFromTime(requestRegistRequest.getFromTime());
			request.setToTime(requestRegistRequest.getToTime());
			request.setTotalTime(Double.parseDouble(requestRegistRequest.getTotalTime()));
			request.setReason(requestRegistRequest.getReason());
			if(employee.getPosition().getCode() == Position.CODE_MANAGER && requestRegistRequest.getStatus().equals("5")) {
				request.setStatus(Request.REQUEST_STATUS_APPROVED);
			}
			else {
				request.setStatus(Integer.parseInt(requestRegistRequest.getStatus()));
			}
			request.setResponseMessage(requestRegistRequest.getResponseMessage());
			request.setDayOffType(dayOffType);
			request.setRecipientId(Long.parseLong(requestRegistRequest.getRecipientId()));
			request.setValidFlag(Integer.parseInt(requestRegistRequest.getValidFlag()));
			
			requestRepository.save(request);
		} else {	//update request
			long id = Long.parseLong(requestRegistRequest.getId());
			request = requestRepository.findById(id);
			if(request == null) {
				throw new Exception("Can not find request with id = " + id);
			}
			else if(requestRegistRequest.getUpdateDate().equals(request.getUpdateDate()) == false) {
				throw new Exception("Someone updated request with id " + requestRegistRequest.getId() + " at " + request.getUpdateDate());
			}
			else {
				Employee employee = employeeRepository.findById(request.getEmployee().getId());
				EmployeeOffStatus employeeOffStatus = employeeOffStatusRepository.findById(currentYear, employee.getId());
				double remainHours = employeeOffStatus.getRemainHours();
				double newRemainHours = remainHours;
				double oldOffHours = request.getTotalTime();
				int oldStatus = request.getStatus();
				double offHours;
				long oldPaymentFlag = request.getDayOffType().getPaymentFlag();
				long newPaymentFlag;
				
				
				if(StringUtil.isNotEmpty(requestRegistRequest.getDayOffTypeId())) {
					DayOffType dayOffType = dayOffTypeRepository.findById(Long.parseLong(requestRegistRequest.getDayOffTypeId()));
					newPaymentFlag = dayOffType.getPaymentFlag();
				} else {
					newPaymentFlag = oldPaymentFlag;
				}
				
				if(StringUtil.isNotEmpty(requestRegistRequest.getTotalTime()) && StringUtil.isEmpty(requestRegistRequest.getValidFlag())
						&& StringUtil.isEmpty(requestRegistRequest.getStatus())) {
					offHours = Double.parseDouble(requestRegistRequest.getTotalTime());
					if(oldPaymentFlag == DayOffType.PAYMENT_FLAG_PAYING && newPaymentFlag == DayOffType.PAYMENT_FLAG_NOT_PAYING) {
						newRemainHours = remainHours + oldOffHours;
					} else if(oldPaymentFlag == DayOffType.PAYMENT_FLAG_PAYING && newPaymentFlag == DayOffType.PAYMENT_FLAG_PAYING) {
						newRemainHours = remainHours + oldOffHours - offHours;
					} else if(oldPaymentFlag == DayOffType.PAYMENT_FLAG_NOT_PAYING && newPaymentFlag == DayOffType.PAYMENT_FLAG_PAYING) {
						newRemainHours = remainHours - offHours;
					}
				}
				else if(StringUtil.isEmpty(requestRegistRequest.getTotalTime()) && StringUtil.isNotEmpty(requestRegistRequest.getValidFlag())
						&& StringUtil.isEmpty(requestRegistRequest.getStatus())) {
					if(requestRegistRequest.getValidFlag().equals("0") && request.getValidFlag() == 1
							&& (oldStatus == Request.REQUEST_STATUS_SAVED || oldStatus == Request.REQUEST_STATUS_RESPONDED)) { //delete request
						if(oldPaymentFlag == DayOffType.PAYMENT_FLAG_PAYING) {
							newRemainHours = remainHours + oldOffHours;
						}
					}
				}
				else if(StringUtil.isEmpty(requestRegistRequest.getTotalTime()) && StringUtil.isEmpty(requestRegistRequest.getValidFlag())
						&& StringUtil.isNotEmpty(requestRegistRequest.getStatus())) {
					if(Integer.parseInt(requestRegistRequest.getStatus()) == Request.REQUEST_STATUS_DENIED
						&& oldStatus == Request.REQUEST_STATUS_WAITING) { //deny request
						if(oldPaymentFlag == DayOffType.PAYMENT_FLAG_PAYING) {
							newRemainHours = remainHours + oldOffHours;
						}
					}
				}
				else if(StringUtil.isNotEmpty(requestRegistRequest.getTotalTime()) && StringUtil.isEmpty(requestRegistRequest.getValidFlag())
						&& StringUtil.isNotEmpty(requestRegistRequest.getStatus())) {
					if(oldStatus == Request.REQUEST_STATUS_SAVED || oldStatus == Request.REQUEST_STATUS_RESPONDED) {
						offHours = Double.parseDouble(requestRegistRequest.getTotalTime());
						if(oldPaymentFlag == DayOffType.PAYMENT_FLAG_PAYING && newPaymentFlag == DayOffType.PAYMENT_FLAG_NOT_PAYING) {
							newRemainHours = remainHours + oldOffHours;
						} else if(oldPaymentFlag == DayOffType.PAYMENT_FLAG_PAYING && newPaymentFlag == DayOffType.PAYMENT_FLAG_PAYING) {
							newRemainHours = remainHours + oldOffHours - offHours;
						} else if(oldPaymentFlag == DayOffType.PAYMENT_FLAG_NOT_PAYING && newPaymentFlag == DayOffType.PAYMENT_FLAG_PAYING) {
							newRemainHours = remainHours - offHours;
						}
					}
				}
				else if(StringUtil.isEmpty(requestRegistRequest.getTotalTime()) && StringUtil.isEmpty(requestRegistRequest.getValidFlag())
						&& StringUtil.isEmpty(requestRegistRequest.getStatus())) {
					newRemainHours = remainHours;
				}
				else {
					throw new Exception("RequestRegistRequest parameter is invalid");
				}
				if(newRemainHours >= 0) {
					employeeOffStatus.setRemainHours(newRemainHours);
					employeeOffStatusRepository.save(employeeOffStatus);
				} else {
					throw new Exception("Off hours exceed remain hours");
				}
				
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
					if(employee.getPosition().getCode() == Position.CODE_MANAGER && requestRegistRequest.getStatus().equals("5")) {
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
				requestRepository.save(request);
			}
		}
		
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
	public RequestBrowsingResponse requestBrowsing(RequestBrowsingRequest request) throws Exception {
		List<Request> requests = requestRepository.browseRequest(request);
		RequestBrowsingResponse response = new RequestBrowsingResponse();
		response.setRequests(requests);
		return response;
	}
	
}
