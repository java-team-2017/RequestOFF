package com.dactech.requestoff.service;

import com.dactech.requestoff.model.entity.Department;

public interface DepartmentService {
	public long registDepartment(Department department);
	
	public Department getDepartment(long id);
}
