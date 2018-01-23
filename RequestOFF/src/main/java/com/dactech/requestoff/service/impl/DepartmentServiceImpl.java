package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.request.DepartmentDetailsRequest;
import com.dactech.requestoff.model.request.DepartmentRegistRequest;
import com.dactech.requestoff.model.request.DepartmentSearchRequest;
import com.dactech.requestoff.model.response.DepartmentDetailsResponse;
import com.dactech.requestoff.model.response.DepartmentRegistResponse;
import com.dactech.requestoff.model.response.DepartmentSearchResponse;
import com.dactech.requestoff.repository.DepartmentRepository;
import com.dactech.requestoff.service.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	DepartmentRepository departmentRepository;
	
	public DepartmentRegistResponse registDepartment(DepartmentRegistRequest departmentRegistRequest) throws Exception {
		DepartmentRegistResponse departmentRegistResponse = new DepartmentRegistResponse();
		
		Department department = departmentRepository.findById(departmentRegistRequest.getId());
		if(department == null) {
			department = new Department();
		}
		else {
			if(departmentRegistRequest.getUpdateDate().equals( department.getUpdateDate() ) == false) {
				throw new Exception("Someone updated Department with id " + departmentRegistRequest.getId() + " at " + department.getUpdateDate());
			}
		}
		
		department.setName(departmentRegistRequest.getName());
		
		Employee manager = new Employee();
		manager.setId(departmentRegistRequest.getManagerId());
		department.setManager(manager);
		
		department.setValidFlag(departmentRegistRequest.getValidFlag());
		
		departmentRepository.save(department);
		
		departmentRegistResponse.setId(department.getId());
		
		return departmentRegistResponse;
	}
	
	public Department getDepartment(long id) {
		return departmentRepository.findById(id);
	}
	
	public DepartmentSearchResponse search(DepartmentSearchRequest departmentSearchRequest) {
		List<Department> listDepartment = departmentRepository.search(departmentSearchRequest);
		DepartmentSearchResponse departmentSearchResponse = new DepartmentSearchResponse(listDepartment);
		return departmentSearchResponse;
	}
	
	@Override
	public DepartmentDetailsResponse details(DepartmentDetailsRequest departmentDetailsRequest) {
		Department department = departmentRepository.findById(departmentDetailsRequest.getId());
		DepartmentDetailsResponse departmentDetailsResponse = new DepartmentDetailsResponse(department);
		return departmentDetailsResponse;
	}
}
