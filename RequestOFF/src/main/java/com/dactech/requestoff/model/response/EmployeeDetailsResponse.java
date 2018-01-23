package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.entity.Employee;

public class EmployeeDetailsResponse extends Common {
	private Employee employee;

	public EmployeeDetailsResponse() {
		super();
	}

	public EmployeeDetailsResponse(Employee employee) {
		super();
		this.employee = employee;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

}
