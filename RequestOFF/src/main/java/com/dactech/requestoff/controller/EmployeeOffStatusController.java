package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.request.EmployeeOffStatusDetailsRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatusRegistRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatusSearchRequest;
import com.dactech.requestoff.model.response.EmployeeOffStatusDetailsResponse;
import com.dactech.requestoff.model.response.EmployeeOffStatusRegistResponse;
import com.dactech.requestoff.model.response.EmployeeOffStatusSearchResponse;
import com.dactech.requestoff.service.EmployeeOffStatusService;

@RestController
public class EmployeeOffStatusController {
	@Autowired
	EmployeeOffStatusService employeeOffStatusService;
	
	@RequestMapping(value = "/employeeOffStatus/regist", method = RequestMethod.POST)
	EmployeeOffStatusRegistResponse eOSRegist(@RequestBody EmployeeOffStatusRegistRequest eOSRRequest) {
		return employeeOffStatusService.employeeOffStatusRegist(eOSRRequest);
	}
	
	@RequestMapping(value = "/employeeOffStatus/details", method = RequestMethod.POST)
	EmployeeOffStatusDetailsResponse details(@RequestBody EmployeeOffStatusDetailsRequest employeeOffStatusDetailsRequest) {
		return employeeOffStatusService.details(employeeOffStatusDetailsRequest);
	}
	
	@RequestMapping(value = "/employeeOffStatus/search", method = RequestMethod.POST)
	EmployeeOffStatusSearchResponse search(@RequestBody EmployeeOffStatusSearchRequest employeeOffStatusSearchRequest) {
		return employeeOffStatusService.search(employeeOffStatusSearchRequest);
	}
}
