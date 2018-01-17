package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.request.DepartmentDetailsRequest;
import com.dactech.requestoff.model.request.DepartmentRegistRequest;
import com.dactech.requestoff.model.request.DepartmentSearchRequest;
import com.dactech.requestoff.model.response.DepartmentDetailsResponse;
import com.dactech.requestoff.model.response.DepartmentRegistResponse;
import com.dactech.requestoff.model.response.DepartmentSearchResponse;
import com.dactech.requestoff.service.DepartmentService;

@RestController
public class DepartmentController {
	@Autowired
	DepartmentService departmentService;
	
	@RequestMapping(value = "/department/regist", method = RequestMethod.POST)
	public DepartmentRegistResponse registDepartment(@RequestBody DepartmentRegistRequest departmentRegistRequest) {
		return departmentService.registDepartment(departmentRegistRequest);
	}
	
	@RequestMapping(value = "/department/search", method = RequestMethod.POST)
	public DepartmentSearchResponse searchDepartment(@RequestBody DepartmentSearchRequest departmentSearchRequest) {
		return departmentService.search(departmentSearchRequest);
	}
	
	@RequestMapping(value = "/department/details", method = RequestMethod.POST)
	public DepartmentDetailsResponse details(@RequestBody DepartmentDetailsRequest departmentDetailsRequest) {
		return departmentService.details(departmentDetailsRequest);
	}
}
