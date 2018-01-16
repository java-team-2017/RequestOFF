package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.request.EmployeeOffStatusRegistRequest;
import com.dactech.requestoff.model.response.EmployeeOffStatusRegistResponse;
import com.dactech.requestoff.service.EmployeeOffStatusService;

@RestController
public class EmployeeOffStatusController {
	@Autowired
	EmployeeOffStatusService employeeOffStatusService;
	
	@RequestMapping(value = "/employeeOffStatus/regist", method = RequestMethod.POST)
	EmployeeOffStatusRegistResponse eOSRegist(@RequestBody EmployeeOffStatusRegistRequest eOSRRequest) {
		return employeeOffStatusService.employeeOffStatusRegist(eOSRRequest);
	}
}
