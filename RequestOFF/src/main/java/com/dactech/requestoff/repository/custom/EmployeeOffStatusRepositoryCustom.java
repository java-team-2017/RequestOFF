package com.dactech.requestoff.repository.custom;

import java.util.List;

import com.dactech.requestoff.model.entity.EmployeeOffStatus;
import com.dactech.requestoff.model.request.EmployeeOffStatusDetailsRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatusSearchRequest;

public interface EmployeeOffStatusRepositoryCustom {
	public List<EmployeeOffStatus> search(EmployeeOffStatusSearchRequest employeeOffStatusSearchRequest);

}
