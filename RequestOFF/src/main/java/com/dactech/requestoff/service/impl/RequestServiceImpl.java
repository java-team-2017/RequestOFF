package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.DayOffType;
import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.EmployeeOffStatus;
import com.dactech.requestoff.model.entity.Position;
import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.model.request.RequestBrowsingRequest;
import com.dactech.requestoff.model.request.RequestDetailsRequest;
import com.dactech.requestoff.model.request.RequestRegistRequest;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.model.request.RequestViewRequest;
import com.dactech.requestoff.model.response.RequestBrowsingResponse;
import com.dactech.requestoff.model.response.RequestDetailsResponse;
import com.dactech.requestoff.model.response.RequestRegistResponse;
import com.dactech.requestoff.model.response.RequestSearchResponse;
import com.dactech.requestoff.model.response.RequestViewResponse;
import com.dactech.requestoff.repository.DayOffTypeRepository;
import com.dactech.requestoff.repository.DepartmentRepository;
import com.dactech.requestoff.repository.EmployeeOffStatusRepository;
import com.dactech.requestoff.repository.EmployeeRepository;
import com.dactech.requestoff.repository.RequestRepository;
import com.dactech.requestoff.service.CompanyYearOffService;
import com.dactech.requestoff.service.RequestService;
import com.dactech.requestoff.service.SlackRequestService;
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
	@Autowired
	SlackRequestService slackRequestService;
	@Autowired
	DepartmentRepository departmentRepository;
	
	@Override
	public RequestRegistResponse regist(RequestRegistRequest requestRegistRequest) throws Exception {
		Request request;
		long currentYear = companyYearOffService.getCurrentYear();
		if(StringUtil.isEmpty(requestRegistRequest.getId())) {	//create new request
			System.out.println("From: " + requestRegistRequest.getFromTime().substring(0, 4));
			System.out.println("To: " + requestRegistRequest.getToTime().substring(0, 4));
			if(requestRegistRequest.getFromTime().substring(0, 4).equals(requestRegistRequest.getToTime().substring(0, 4)) == false) {
				throw new Exception("Thời gian nghỉ của một request không được phép kéo dài sang năm khác.<br/>Vui lòng tạo nhiều request");
			}
			
			request = new Request();
			Employee employee = employeeRepository.findById(Long.parseLong(requestRegistRequest.getEmployeeId()));
			DayOffType dayOffType = dayOffTypeRepository.findById(Long.parseLong(requestRegistRequest.getDayOffTypeId()));
			long yearOfRequest = Long.parseLong(requestRegistRequest.getToTime().substring(0, 4));
			double offHours = Double.parseDouble(requestRegistRequest.getTotalTime());
			
			request.setEmployee(employee);
			request.setFromTime(requestRegistRequest.getFromTime());
			request.setToTime(requestRegistRequest.getToTime());
			request.setTotalTime(offHours);
			request.setReason(requestRegistRequest.getReason());
			if(employee.getPosition().getCode() == Position.CODE_MANAGER && departmentRepository.findByManagerId(employee.getId()) != null
					&& requestRegistRequest.getStatus().equals("5")) {
				request.setStatus(Request.REQUEST_STATUS_APPROVED);
				if(dayOffType.getPaymentFlag() == DayOffType.PAYMENT_FLAG_PAYING && yearOfRequest == currentYear) {
					EmployeeOffStatus employeeOffStatus = employeeOffStatusRepository.findById(currentYear, employee.getId());
					double remainHours = employeeOffStatus.getRemainHours();
					double newRemainHours = remainHours - offHours;
					employeeOffStatus.setRemainHours(newRemainHours);
					employeeOffStatusRepository.save(employeeOffStatus);
				}
			}
			else {
				request.setStatus(Integer.parseInt(requestRegistRequest.getStatus()));
			}
			request.setResponseMessage(requestRegistRequest.getResponseMessage());
			request.setDayOffType(dayOffType);
			request.setRecipientId(Long.parseLong(requestRegistRequest.getRecipientId()));
			request.setValidFlag(Integer.parseInt(requestRegistRequest.getValidFlag()));
			
			if(requestRegistRequest.getStatus().equals("5")) {
				requestRepository.save(request);
				slackRequestService.sendRequestMsgToSlack(request);
			} else {
				requestRepository.save(request);
			}
			
		} else {	//update request
			long id = Long.parseLong(requestRegistRequest.getId());
			request = requestRepository.findById(id);
			if(request == null) {
				throw new Exception("Không tìm thấy request với id " + id);
			}
			else if(requestRegistRequest.getUpdateDate().equals(request.getUpdateDate()) == false) {
				throw new Exception("Request với id " + requestRegistRequest.getId() + " đã được chỉnh sửa vào lúc " + request.getUpdateDate()
									+ ".<br/>Vui lòng tải lại trang để cập nhật thông tin mới nhất");
			}
			else {
				long newFromYear, newToYear;
				if(StringUtil.isNotEmpty(requestRegistRequest.getFromTime())) {
					newFromYear = Long.parseLong(requestRegistRequest.getFromTime().substring(0, 4));
				} else {
					newFromYear = Long.parseLong(request.getFromTime().substring(0, 4));
				}
				
				if(StringUtil.isNotEmpty(requestRegistRequest.getToTime())) {
					newToYear = Long.parseLong(requestRegistRequest.getToTime().substring(0, 4));
				} else {
					newToYear = Long.parseLong(request.getToTime().substring(0, 4));
				}
				
				if(newFromYear != newToYear) {
					throw new Exception("Thời gian nghỉ của một request không được phép kéo dài sang năm khác.<br/>Vui lòng tạo nhiều request");
				}
				
				Employee employee = employeeRepository.findById(request.getEmployee().getId());
				long newYearOfRequest;
				
				if(StringUtil.isNotEmpty(requestRegistRequest.getFromTime())) {
					request.setFromTime(requestRegistRequest.getFromTime());
				}
				if(StringUtil.isNotEmpty(requestRegistRequest.getToTime())) {
					newYearOfRequest = Long.parseLong(requestRegistRequest.getToTime().substring(0, 4));
					request.setToTime(requestRegistRequest.getToTime());
				} else {
					newYearOfRequest = Long.parseLong(request.getToTime().substring(0, 4));
				}
				if(StringUtil.isNotEmpty(requestRegistRequest.getTotalTime())) {
					request.setTotalTime(Double.parseDouble(requestRegistRequest.getTotalTime()));
				}
				if(StringUtil.isNotEmpty(requestRegistRequest.getReason())) {
					request.setReason(requestRegistRequest.getReason());
				}
				if(StringUtil.isNotEmpty(requestRegistRequest.getStatus())) {
					if(employee.getPosition().getCode() == Position.CODE_MANAGER && departmentRepository.findByManagerId(employee.getId()) != null
							&& requestRegistRequest.getStatus().equals("5")) {	//manager send request
						request.setStatus(Request.REQUEST_STATUS_APPROVED);
						if(request.getDayOffType().getPaymentFlag() == DayOffType.PAYMENT_FLAG_PAYING && newYearOfRequest == currentYear) {
							EmployeeOffStatus employeeOffStatus = employeeOffStatusRepository.findById(currentYear, employee.getId());
							double remainHours = employeeOffStatus.getRemainHours();
							double offHours;
							if(StringUtil.isNotEmpty(requestRegistRequest.getTotalTime())) {
								offHours = Long.parseLong(requestRegistRequest.getTotalTime());
							} else {
								offHours = request.getTotalTime();
							}
							double newRemainHours = remainHours - offHours;
							employeeOffStatus.setRemainHours(newRemainHours);
							employeeOffStatusRepository.save(employeeOffStatus);
						}
					}
					else {
						if(Integer.parseInt(requestRegistRequest.getStatus()) == Request.REQUEST_STATUS_APPROVED
							&& request.getStatus() == Request.REQUEST_STATUS_WAITING) { //approve request
							if(request.getDayOffType().getPaymentFlag() == DayOffType.PAYMENT_FLAG_PAYING && newYearOfRequest == currentYear) {
								EmployeeOffStatus employeeOffStatus = employeeOffStatusRepository.findById(currentYear, employee.getId());
								double remainHours = employeeOffStatus.getRemainHours();
								double offHours;
								if(StringUtil.isNotEmpty(requestRegistRequest.getTotalTime())) {
									offHours = Long.parseLong(requestRegistRequest.getTotalTime());
								} else {
									offHours = request.getTotalTime();
								}
								double newRemainHours = remainHours - offHours;
								employeeOffStatus.setRemainHours(newRemainHours);
								employeeOffStatusRepository.save(employeeOffStatus);
							}
						}
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
				
				if(requestRegistRequest.getStatus().equals("5")) {
					requestRepository.save(request);
					slackRequestService.sendRequestMsgToSlack(request);
				} else {
					requestRepository.save(request);
				}
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

	@Override
	public RequestViewResponse viewRequest(RequestViewRequest request) throws Exception {
		List<Request> requests = requestRepository.viewRequest(request);
		RequestViewResponse response = new RequestViewResponse();
		response.setRequest(requests);
		return response;
	}
	
}
