package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.request.EmployeeDetailsRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatisticsRequest;
import com.dactech.requestoff.model.request.EmployeeRegistRequest;
import com.dactech.requestoff.model.request.EmployeeSearchRequest;
import com.dactech.requestoff.model.response.EmployeeDetailsResponse;
import com.dactech.requestoff.model.response.EmployeeOffStatisticsResponse;
import com.dactech.requestoff.model.response.EmployeeRegistResponse;
import com.dactech.requestoff.model.response.EmployeeSearchResponse;
import com.dactech.requestoff.service.EmployeeService;

@RestController
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;

	@RequestMapping(value = "/employee/regist", method = RequestMethod.POST)
	EmployeeRegistResponse employeeRegist(@RequestBody EmployeeRegistRequest employeeRegistRequest) {
		EmployeeRegistResponse response;
		try {
			response = employeeService.employeeRegist(employeeRegistRequest);
			response.setStatusInfo(new StatusInfo(StatusInfo.SUCCESS, null));
		} catch (Exception e) {
			response = new EmployeeRegistResponse();
			response.setStatusInfo(new StatusInfo(StatusInfo.ERROR, e.getMessage()));
		}

		return response;
	}

	@RequestMapping(value = "/employee/search", method = RequestMethod.POST)
	EmployeeSearchResponse employeeSearch(@RequestBody EmployeeSearchRequest employeeSearchRequest) {
		EmployeeSearchResponse response = new EmployeeSearchResponse();
		StatusInfo statusInfo = null;
		try {
			response = employeeService.employeeSearch(employeeSearchRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		response.setStatusInfo(statusInfo);
		return response;
	}

	@RequestMapping(value = "/employee/details", method = RequestMethod.POST)
	EmployeeDetailsResponse employeeDetails(@RequestBody EmployeeDetailsRequest employeeDetailsRequest) {
		EmployeeDetailsResponse response = new EmployeeDetailsResponse();
		StatusInfo statusInfo = null;
		try {
			response = employeeService.employeeDetails(employeeDetailsRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		response.setStatusInfo(statusInfo);
		return response;
	}
	
	@RequestMapping(value = "/employee/statistics", method = RequestMethod.POST)
	EmployeeOffStatisticsResponse employeeStatistics(@RequestBody EmployeeOffStatisticsRequest employeeOffStatisticsRequest) {
		EmployeeOffStatisticsResponse response;
		try {
			response = employeeService.employeeOffStatistics(employeeOffStatisticsRequest);
			response.setStatusInfo(new StatusInfo(StatusInfo.SUCCESS, null));
		} catch (Exception e) {
			response = new EmployeeOffStatisticsResponse();
			response.setStatusInfo(new StatusInfo(StatusInfo.ERROR, e.getMessage()));
		}
		return response;
	}

}
