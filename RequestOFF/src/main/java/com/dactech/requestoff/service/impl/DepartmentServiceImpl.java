package com.dactech.requestoff.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.repository.DepartmentRepository;
import com.dactech.requestoff.service.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	DepartmentRepository departmentRepository;
	
	public long registDepartment(Department department) {
		departmentRepository.save(department);
		return department.getId();
	}
	
	public Department getDepartment(long id) {
		return departmentRepository.findById(id);
	}
}
