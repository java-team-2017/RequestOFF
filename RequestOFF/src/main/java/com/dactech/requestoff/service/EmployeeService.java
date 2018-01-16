package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.EmployeeRegistRequest;
import com.dactech.requestoff.model.request.EmployeeSearchRequest;
import com.dactech.requestoff.model.response.EmployeeRegistResponse;
import com.dactech.requestoff.model.response.EmployeeSearchResponse;

public interface EmployeeService {
	EmployeeRegistResponse employeeRegist(EmployeeRegistRequest employeeRegistRequest);

	EmployeeSearchResponse employeeSearch(EmployeeSearchRequest employeeSearchRequest);
}
