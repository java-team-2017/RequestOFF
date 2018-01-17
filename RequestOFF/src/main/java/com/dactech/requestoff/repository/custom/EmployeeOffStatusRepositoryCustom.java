package com.dactech.requestoff.repository.custom;

import com.dactech.requestoff.model.entity.EmployeeOffStatus;
import com.dactech.requestoff.model.request.EmployeeOffStatusDetailsRequest;

public interface EmployeeOffStatusRepositoryCustom {
	public EmployeeOffStatus details(EmployeeOffStatusDetailsRequest employeeOffStatusDetailsRequest);
}
