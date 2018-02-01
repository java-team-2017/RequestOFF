package com.dactech.requestoff.repository.custom;

import java.util.List;

import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.request.EmployeeSearchRequest;

public interface EmployeeRepositoryCustom {
	public List<Employee> search(EmployeeSearchRequest employeeSearchRequest);
	public List<Employee> search(String name, String teamId, String departmentId);
	
}
