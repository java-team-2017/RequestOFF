package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.EmployeeRegistRequest;
import com.dactech.requestoff.model.response.EmployeeRegistResponse;

public interface EmployeeService {
	EmployeeRegistResponse employeeRegist(EmployeeRegistRequest employeeRegistRequest);
}
