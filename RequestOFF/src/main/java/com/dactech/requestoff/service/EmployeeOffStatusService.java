package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.EmployeeOffStatusDetailsRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatusRegistRequest;
import com.dactech.requestoff.model.response.EmployeeOffStatusDetailsResponse;
import com.dactech.requestoff.model.response.EmployeeOffStatusRegistResponse;

public interface EmployeeOffStatusService {
	EmployeeOffStatusRegistResponse employeeOffStatusRegist(EmployeeOffStatusRegistRequest employeeOffStatusRegistRequest);
	
	public EmployeeOffStatusDetailsResponse details(EmployeeOffStatusDetailsRequest employeeOffStatusDetailsRequest);
}
