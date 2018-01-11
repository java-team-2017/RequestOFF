package com.dactech.requestoff.service;

import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.request.DepartmentRegistRequest;
import com.dactech.requestoff.model.request.DepartmentSearchRequest;
import com.dactech.requestoff.model.response.DepartmentRegistResponse;
import com.dactech.requestoff.model.response.DepartmentSearchResponse;

public interface DepartmentService {
	public DepartmentRegistResponse registDepartment(DepartmentRegistRequest departmentRegistRequest);
	
	public Department getDepartment(long id);
	
	public DepartmentSearchResponse search(DepartmentSearchRequest departmentSearchRequest);
}
