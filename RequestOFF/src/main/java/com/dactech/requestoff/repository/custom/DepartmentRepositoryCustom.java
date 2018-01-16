package com.dactech.requestoff.repository.custom;

import java.util.List;

import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.request.DepartmentSearchRequest;

public interface DepartmentRepositoryCustom {
	public List<Department> search(DepartmentSearchRequest departmentSearchRequest);
}
