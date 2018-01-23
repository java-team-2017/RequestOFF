package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.entity.EmployeeOffStatus;
import com.fasterxml.jackson.annotation.JsonProperty;

public class EmployeeOffStatusDetailsResponse extends Common{
	@JsonProperty("employee_off_status")
	EmployeeOffStatus employeeOffStatus;

	public EmployeeOffStatusDetailsResponse() {
		super();
	}

	public EmployeeOffStatusDetailsResponse(EmployeeOffStatus employeeOffStatus) {
		super();
		this.employeeOffStatus = employeeOffStatus;
	}

	public EmployeeOffStatus getEmployeeOffStatus() {
		return employeeOffStatus;
	}

	public void setEmployeeOffStatus(EmployeeOffStatus employeeOffStatus) {
		this.employeeOffStatus = employeeOffStatus;
	}

}
