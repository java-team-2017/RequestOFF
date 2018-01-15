package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.request.EmployeeRegistRequest;
import com.dactech.requestoff.model.request.EmployeeSearchRequest;
import com.dactech.requestoff.model.response.EmployeeRegistResponse;
import com.dactech.requestoff.model.response.EmployeeSearchResponse;
import com.dactech.requestoff.service.EmployeeService;

@RestController
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;

	@RequestMapping(value = "/employee/regist", method = RequestMethod.POST)
	EmployeeRegistResponse employeeRegist(@RequestBody EmployeeRegistRequest employeeRegistRequest) {
		return employeeService.employeeRegist(employeeRegistRequest);
	}
	
	@RequestMapping(value = "/employee/search", method = RequestMethod.POST)
	EmployeeSearchResponse employeeSearch(@RequestBody EmployeeSearchRequest employeeSearchRequest) {
		return employeeService.employeeSearch(employeeSearchRequest);
	}

}
