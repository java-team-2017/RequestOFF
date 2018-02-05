package com.dactech.requestoff.service;

import java.util.List;

import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.request.EmployeeDetailsRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatisticsPagingRequest;
import com.dactech.requestoff.model.request.EmployeeRegistRequest;
import com.dactech.requestoff.model.request.EmployeeSearchRequest;
import com.dactech.requestoff.model.response.EmployeeDetailsResponse;
import com.dactech.requestoff.model.response.EmployeeOffStatisticsPagingResponse;
import com.dactech.requestoff.model.response.EmployeeRegistResponse;
import com.dactech.requestoff.model.response.EmployeeSearchResponse;

public interface EmployeeService {
	EmployeeOffStatisticsPagingResponse employeeOffStatisticsPaging(EmployeeOffStatisticsPagingRequest request) throws Exception;
	
	EmployeeRegistResponse employeeRegist(EmployeeRegistRequest employeeRegistRequest) throws Exception;

	EmployeeSearchResponse employeeSearch(EmployeeSearchRequest employeeSearchRequest);

	EmployeeDetailsResponse employeeDetails(EmployeeDetailsRequest employeeDetailsRequest);
	
	public List<Employee> search(String name, String teamId, String departmentId);
	
	public Employee findByEmail(String email);
}
