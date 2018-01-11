package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.request.DepartmentRegistRequest;
import com.dactech.requestoff.model.response.DepartmentRegistResponse;
import com.dactech.requestoff.service.DepartmentService;

@RestController
public class DepartmentController {
	@Autowired
	DepartmentService departmentService;
	
	@RequestMapping(value = "/department", method = RequestMethod.POST)
	public DepartmentRegistResponse registDepartment(@RequestBody DepartmentRegistRequest departmentRegistRequest) {
		Department department;
		
		if(departmentService.getDepartment(departmentRegistRequest.getId()) != null) {
			department = departmentService.getDepartment(departmentRegistRequest.getId());
		}
		else {
			department = new Department();
		}
		
		department.setName(departmentRegistRequest.getName());
		
		Employee manager = new Employee();
		manager.setId(departmentRegistRequest.getManagerId());
		department.setManager(manager);
		
		departmentService.registDepartment(department);
		
		DepartmentRegistResponse departmentRegistResponse = new DepartmentRegistResponse(department.getId());
		
		return departmentRegistResponse;
	}
}
