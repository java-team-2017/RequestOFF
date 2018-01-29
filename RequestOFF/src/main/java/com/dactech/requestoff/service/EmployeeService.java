package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.EmployeeDetailsRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatisticsRequest;
import com.dactech.requestoff.model.request.EmployeeRegistRequest;
import com.dactech.requestoff.model.request.EmployeeSearchRequest;
import com.dactech.requestoff.model.response.EmployeeDetailsResponse;
import com.dactech.requestoff.model.response.EmployeeOffStatisticsResponse;
import com.dactech.requestoff.model.response.EmployeeRegistResponse;
import com.dactech.requestoff.model.response.EmployeeSearchResponse;

public interface EmployeeService {
	EmployeeOffStatisticsResponse employeeOffStatistics(EmployeeOffStatisticsRequest employeeOffStatisticsRequest) throws Exception;
	
	EmployeeRegistResponse employeeRegist(EmployeeRegistRequest employeeRegistRequest) throws Exception;

	EmployeeSearchResponse employeeSearch(EmployeeSearchRequest employeeSearchRequest);

	EmployeeDetailsResponse employeeDetails(EmployeeDetailsRequest employeeDetailsRequest);
}
