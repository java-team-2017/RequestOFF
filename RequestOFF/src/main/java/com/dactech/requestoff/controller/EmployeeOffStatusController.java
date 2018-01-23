package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.request.EmployeeOffStatusDetailsRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatusRegistRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatusSearchRequest;
import com.dactech.requestoff.model.response.EmployeeOffStatusDetailsResponse;
import com.dactech.requestoff.model.response.EmployeeOffStatusRegistResponse;
import com.dactech.requestoff.model.response.EmployeeOffStatusSearchResponse;
import com.dactech.requestoff.model.response.TeamRegistResponse;
import com.dactech.requestoff.model.response.TeamSearchResponse;
import com.dactech.requestoff.service.EmployeeOffStatusService;

@RestController
public class EmployeeOffStatusController {
	@Autowired
	EmployeeOffStatusService employeeOffStatusService;

	@RequestMapping(value = "/employeeOffStatus/regist", method = RequestMethod.POST)
	EmployeeOffStatusRegistResponse eOSRegist(@RequestBody EmployeeOffStatusRegistRequest eOSRRequest) {
		EmployeeOffStatusRegistResponse response;
		try {
			response = employeeOffStatusService.employeeOffStatusRegist(eOSRRequest);
			response.setStatusInfo(new StatusInfo(StatusInfo.SUCCESS, null));
		} catch (Exception e) {
			response = new EmployeeOffStatusRegistResponse();
			response.setStatusInfo(new StatusInfo(StatusInfo.ERROR, e.getMessage()));
		}

		return response;
	}

	@RequestMapping(value = "/employeeOffStatus/details", method = RequestMethod.POST)
	EmployeeOffStatusDetailsResponse details(@RequestBody EmployeeOffStatusDetailsRequest employeeOffStatusDetailsRequest) {
		EmployeeOffStatusDetailsResponse employeeOffStatusDetailsResponse = new EmployeeOffStatusDetailsResponse();
		try {
			employeeOffStatusDetailsResponse = employeeOffStatusService.details(employeeOffStatusDetailsRequest);
			employeeOffStatusDetailsResponse.setStatusInfo(new StatusInfo(StatusInfo.SUCCESS, null));
		} catch (Exception e) {
			employeeOffStatusDetailsResponse.setStatusInfo(new StatusInfo(StatusInfo.ERROR, e.getMessage()));
		}
		
		return employeeOffStatusDetailsResponse;
	}

	@RequestMapping(value = "/employeeOffStatus/search", method = RequestMethod.POST)
	EmployeeOffStatusSearchResponse search(@RequestBody EmployeeOffStatusSearchRequest employeeOffStatusSearchRequest) {
		return employeeOffStatusService.search(employeeOffStatusSearchRequest);
	}
}
