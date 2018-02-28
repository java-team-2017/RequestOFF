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
import com.dactech.requestoff.util.StringUtil;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	DepartmentRepository departmentRepository;
	
	public DepartmentRegistResponse registDepartment(DepartmentRegistRequest departmentRegistRequest) throws Exception {
		Department department;
		
		if(StringUtil.isEmpty(departmentRegistRequest.getId())) {	//create new department
			department = new Department();
			department.setName(departmentRegistRequest.getName());
			
			Employee manager = new Employee();
			manager.setId(Long.parseLong(departmentRegistRequest.getManagerId()));
			department.setManager(manager);
			
			department.setValidFlag(Integer.parseInt(departmentRegistRequest.getValidFlag()));
		}
		else {
			department = departmentRepository.findById(Long.parseLong(departmentRegistRequest.getId()));
			if(department == null) {
				throw new Exception("Can not find department with id = " + departmentRegistRequest.getId());
			}
			else if(departmentRegistRequest.getUpdateDate().equals(department.getUpdateDate()) == false) {
				throw new Exception("Someone updated department with id " + departmentRegistRequest.getId() + " at " + department.getUpdateDate());
			}
			else {
				if(StringUtil.isNotEmpty(departmentRegistRequest.getName())) {
					department.setName(departmentRegistRequest.getName());
				}
				if(StringUtil.isNotEmpty(departmentRegistRequest.getManagerId())) {
					Employee manager = new Employee();
					manager.setId(Long.parseLong(departmentRegistRequest.getManagerId()));
					department.setManager(manager);
				}
				if(StringUtil.isNotEmpty(departmentRegistRequest.getValidFlag())) {
					department.setValidFlag(Integer.parseInt(departmentRegistRequest.getValidFlag()));
				}
			}
		}
		departmentRepository.save(department);
		
		DepartmentRegistResponse departmentRegistResponse = new DepartmentRegistResponse();
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
		Department department = departmentRepository.findById(Long.parseLong(departmentDetailsRequest.getId()));
		DepartmentDetailsResponse departmentDetailsResponse = new DepartmentDetailsResponse(department);
		return departmentDetailsResponse;
	}
}
